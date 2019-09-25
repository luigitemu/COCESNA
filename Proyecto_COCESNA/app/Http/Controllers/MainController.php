<?php

namespace App\Http\Controllers;

use App\Personal;                       // Eloquent
use App\Usuarios;                       // Eloquent
use Illuminate\Http\Request;            // Request()
use Illuminate\Support\Facades\DB;      // Importar DB
use Illuminate\Support\Facades\Crypt;   // Encriptar/Desencriptar contraseñas
use Illuminate\Support\Facades\Hash;    // Manejo de hashes
use Mail;                               // Clase Mail
use App\Mail\SendMailable;

class MainController extends Controller
{




    public function index(Request $request)
    {
        $request->session()->forget('auth');
        $request->session()->forget('noEmpleado');
        $request->session()->forget('nombreCompleto');
        $request->session()->forget('nombres');
        return view('iniciarSesion');
    }




    public function verificar(Request $request)
    {
        // Valida la informacion entrante, de no cumplirse las reglas
        // Regresa a la pagina de iniciar sesion con los errores
        $data = $request->validate([
            'numeroEmpleado' => ['required','exists:personal,no_empleado'], //verifica si existe el numero de empleado en la tabla personal, en la columna no_empleado
            'contrasena' => ['required']
        ],[
            'numeroEmpleado.required' => 'El número de empleado es obligatorio',
            'numeroEmpleado.exists' => 'El número de empleado es invalido',
            'contrasena.required' => 'La contraseña es obligatoria',
        ]);

        /**
         * 
         * Metodo 1: Usando cifrado (encrypt/decrypt)
         * 
         *  */
        // Busca la contraseña perteneciente al numero de empleado y la desencripta
        // se almacena en la variable $pass
        $usuario = DB::table('usuarios')
                    ->join('personal','usuarios.id_personal','=','personal.id_personal')
                    ->where('no_empleado',$data['numeroEmpleado'])
                    ->first();

        $pass = Crypt::decryptString($usuario->contrasena);
        
        // Compara la contraseña ingresada con la obtenida en la consulta, si son iguales
        // entonces ingresa al sistema, sino entonces regresa a iniciar sesion
        // mostrando el error de contraseña incorrecta
        if($pass != $data['contrasena'])
        {
            return back()->withErrors([
                'contrasena'=>'La contraseña es incorrecta',
            ])->withInput();
        }
        else
        {
            // Almacenar la hora de entrada al sistema
            DB::select('call reg_entrada_guardar(?,?,?,?,?,?)',
            array(
                $usuario->nombres." ".$usuario->apellidos,
                substr(env('APP_KEY'),7,-12),
                Hash::make($usuario->contrasena),
                $usuario->email,
                $usuario->activo,
                $request->_token,
            ));

            $posicion = $usuario->id_posicion;

            $request->session()->put('noEmpleado',$usuario->no_empleado);
            $request->session()->put('nombres',$usuario->nombres);
            $request->session()->put('nombreCompleto',$usuario->nombres." ".$usuario->apellidos);
            
            if($posicion == 1)
            {
                $areas  = array();
                $areas = DB::table('areas_de_preguntas')->get();

                $request->session()->put('auth','1');

                return view('principalAdmin', [
                    'areas'=> $areas
                ]);
            } else
            {
                $pregFiltro = DB::table('pregunta_filtro')->first();
                
                $request->session()->put('auth','2');

                return view('preguntaFiltro')->with([
                        'datos' => $data['numeroEmpleado'],
                        'preguntaFiltro' => $pregFiltro->pregunta,
                    ]);   
            }
            
        } 
        
        /**
         * 
         * Metodo 2: Usando hashes
         * 
         *  */
        /*
        $usuario = DB::table('personal')
                    ->where('no_empleado',$data['numeroEmpleado'])
                    ->first();
        // Crea un hash con los datos ingresados 
        // si los hashes coinciden entonces la contraseña es correcta
        if(Hash::check($data['contrasena'],$usuario->contrasena))
        {
            $posicion = $usuario->id_posicion;
            if($posicion == 1)
            {
                return redirect()->route('administrador.principal');
            }
            return redirect()->route('encuesta.preguntaFiltro');   
        }else
        {
            return back()->withErrors([
                'contrasena'=>'La contraseña es incorrecta',
            ])->withInput();
        }    
        */

        
    }




    // Si es el administrador quien ingreso, entonces cargar las areas de preguntas
    public function ingresarComoAdmin(Request $request)
    {
        if(request()->session()->get('auth')!='1')
        {
            return redirect()->route('sistema.inicio');
        }

        $areas  = array();
        $areas = DB::table('areas_de_preguntas')->get();

        return view('principalAdmin', [
            'areas'=> $areas
        ]);
    }
    
    


    // Define que ruta se tomará de acuerdo a la respuesta de la pregunta filtro 
    public function seleccionarEstado()
    {
        if(request()->noEmpleado)
        {
            $query = DB::table('personal')
                        ->select('id_personal')
                        ->where('no_empleado',request()->noEmpleado)
                        ->first();

            $respuesta = request()->btn;

            if ($respuesta)
            {
                $idRespuesta = DB::table('respuestas')
                                ->select('id_respuesta')
                                ->where('contenido','=','si')
                                ->first();
                // dd($idRespuesta->id_respuesta);                
                DB::select('call log_usuarios_guardar(?,?,?,?,?,?)',
                array(
                    $query->id_personal,
                    $idRespuesta->id_respuesta,
                    NULL,
                    NULL,
                    NULL,
                    '1',
                ));
                request()->session()->forget('auth');
                request()->session()->forget('noEmpleado');
                request()->session()->forget('nombreCompleto');
                request()->session()->forget('nombres');
                return view('finEncuesta');
            }
            else
            {
                $idRespuesta = DB::table('respuestas')
                                ->select('id_respuesta')
                                ->where('contenido','=','no')
                                ->first();
                DB::select('call log_usuarios_guardar(?,?,?,?,?,?)',
                array(
                    $query->id_personal,
                    $idRespuesta->id_respuesta,
                    NULL,
                    NULL,
                    NULL,
                    '1',
                ));
                return redirect()->route('encuesta.mostrarAreas');
            }
        } else 
        {
            return abort(404);
        }
    }





    // Esta funcion envía los correos a los usuarios permitidos
    protected function enviarCorreo($noEmp,$parametros)
    {
        $controlador = DB::table('personal')
                        ->join('usuarios','usuarios.id_personal','=','personal.id_personal')
                        ->where('no_empleado',$noEmp)
                        ->first();

        $administrador = DB::table('personal')
                            ->join('usuarios','usuarios.id_personal','=','personal.id_personal')
                            ->where('id_posicion','1')
                            ->first();

        Mail::to([
                    $administrador->email, 
                    $controlador->email,
                ])
                ->send(new SendMailable(
                    $controlador->nombres." ".$controlador->apellidos,
                    $noEmp,
                    $parametros,
                ));

        return "Mensaje enviado";
    }




    // Si el controlador termino la encuesta entonces muestra una pagina de confirmacion
    public function finalizar(Request $request)
    {
        if($request->session()->get('auth')!='1' && $request->session()->get('auth')!='2')
        {
            return redirect()->route('sistema.inicio');
        }
        $query = DB::table('personal')
                        ->select('id_personal')
                        ->where('no_empleado',$request->session()->get('noEmpleado'))
                        ->first();

        $resultados = DB::table('log_usuarios')
                        ->select(DB::raw('areas_de_preguntas.nombre as area'),'log_usuarios.fecha_creacion',DB::raw('preguntas.contenido as pregunta'),DB::raw('respuestas.contenido as respuesta'))
                        ->join('respuestas','log_usuarios.id_respuesta','=','respuestas.id_respuesta')
                        ->join('preguntas','log_usuarios.id_pregunta','=','preguntas.id_pregunta')
                        ->join('areas_de_preguntas','log_usuarios.id_area','=','areas_de_preguntas.id_area')
                        ->where('log_usuarios.id_personal','=',$query->id_personal)
                        ->whereDate('log_usuarios.fecha_creacion','=',date('Y-m-d'))
                        ->get();

        $this->enviarCorreo($request->session()->get('noEmpleado'),$resultados);
        $request->session()->forget('auth');
        $request->session()->forget('noEmpleado');
        $request->session()->forget('nombreCompleto');
        $request->session()->forget('nombres');
        return 'correo enviado con exito';//.$respuestas;
        // return $respuestas;
    }




    // Almacena las respuestas de los controladores en la base de datos
    public function guardarRespuestas(Request $request)
    {
        if($request->session()->get('auth')!='1' && $request->session()->get('auth')!='2')
        {
            return redirect()->route('sistema.inicio');
        }
        
        $idRespuesta = DB::table('respuestas')
        ->select('id_respuesta')
        ->where('contenido','=', $request->respuesta)
        ->first();

        $idPregunta = DB::table('preguntas')
        ->select('id_pregunta')
        ->where('contenido','=', $request->pregunta)
        ->first();

        $idPersonal = DB::table('personal')
                        ->select('id_personal')
                        ->where('no_empleado',$request->session()->get('noEmpleado'))
                        ->first();


        DB::select('call log_usuarios_guardar(?,?,?,?,?,?)',
            array(
                // ,
                $idPersonal->id_personal,
                $idRespuesta->id_respuesta,
                $request->idArea,
                $idPregunta->id_pregunta,
                NULL,
                '0',
            ));

        return json_encode($idPregunta);
    }




    //
    public function recuperarContrasena()
    {
        //$this->enviarCorreo($request->session()->get('noEmpleado'));
        return request();
    }
}
