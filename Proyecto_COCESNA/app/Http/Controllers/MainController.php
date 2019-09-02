<?php

namespace App\Http\Controllers;

use App\Personal;
use App\Usuarios;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB; //Importar DB
use Illuminate\Support\Facades\Crypt; //Encriptar/Desencriptar contraseñas
use Illuminate\Support\Facades\Hash;  //Manejo de hashes
use Mail;
use App\Mail\SendMailable;

class MainController extends Controller
{




    public function index()
    {
        return view('iniciarSesion');
    }




    public function finalizar()
    {
        return view('finEncuesta');
    }




    public function ingresarComoAdmin()
    {
        $areas  = array();
        $areas = DB::table('areas_de_preguntas')->get();

        return view('principalAdmin', [
            'areas'=> $areas
        ]);
        return view('principalAdmin');
    }




    public function preguntar()
    {
        return view('preguntaFiltro');
    }




    public function verificar()
    {
        //Valida la informacion entrante, de no cumplirse las reglas
        //regresa a la pagina de iniciar sesion con los errores
        $data = request()->validate([
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
        //Busca la contraseña perteneciente al numero de empleado y la desencripta
        //se almacena en la variable $pass
        $usuario = DB::table('usuarios')
                    ->join('personal','usuarios.id_personal','=','personal.id_personal')
                    ->where('no_empleado',$data['numeroEmpleado'])
                    ->first();

        $pass = Crypt::decryptString($usuario->contrasena);
        
        //Compara la contraseña ingresada con la obtenida en la consulta, si son iguales
        //entonces ingresa al sistema, sino entonces regresa a iniciar sesion
        //mostrando el error de contraseña incorrecta
        if($pass != $data['contrasena'])
        {
            return back()->withErrors([
                'contrasena'=>'La contraseña es incorrecta',
            ])->withInput();
        }
        else
        {
            //Almacenar la hora de entrada al sistema
            DB::select('call reg_entrada_guardar(?,?,?,?,?,?)',
            array(
                $usuario->nombres." ".$usuario->apellidos,
                substr(env('APP_KEY'),7,-12),
                Hash::make($usuario->contrasena),
                $usuario->email,
                $usuario->activo,
                request()->_token,
            ));

            $posicion = $usuario->id_posicion;
            if($posicion == 1)
            {
                return redirect()->route('administrador.principal');
            }
            $pregFiltro = DB::table('pregunta_filtro')->first();
            
            return view('preguntaFiltro')->with([
                    'datos' => $data['numeroEmpleado'],
                    'preguntaFiltro' => $pregFiltro->pregunta,
                ]);   
        } 
        
        /**
         * 
         * Metodo 2: Usando hashes
         * 
         *  */
        /*
        //Busca la contraseña perteneciente al numero de empleado
        $usuario = DB::table('personal')
                    ->where('no_empleado',$data['numeroEmpleado'])
                    ->first();
        //Crea un hash con los datos ingresados 
        //si los hashes coinciden entonces la contraseña es correcta
        if(Hash::check($data['contrasena'],$usuario->contrasena))
        {
            //dd($usuario->contrasena);
            $posicion = $usuario->id_posicion;
            if($posicion == 1)
            {
                return redirect()->route('administrador.principal');
            }
            return redirect()->route('encuesta.preguntaFiltro');   
        }else
        {
            //dd($data['contrasena']);
            return back()->withErrors([
                'contrasena'=>'La contraseña es incorrecta',
            ])->withInput();
        }    
        */

        
    }
    
    

    //Define que ruta se tomará de acuerdo a la respuesta de la pregunta filtro 
    public function seleccionarEstado()
    {
        $query = DB::table('personal')
                    ->select('id_personal')
                    ->where('no_empleado',request()->noEmpleado)
                    ->first();

        $respuesta = request()->btn;

        if ($respuesta)
        {
            DB::select('call log_usuarios_guardar(?,?,?,?,?,?)',
            array(
                $query->id_personal,
                '1',
                NULL,
                NULL,
                NULL,
                '1',
            ));
            $this->enviarCorreo(request()->noEmpleado);
            return redirect()->route('encuesta.fin');
        }
        else
        {
            DB::select('call log_usuarios_guardar(?,?,?,?,?,?)',
            array(
                $query->id_personal,
                '2',
                NULL,
                NULL,
                NULL,
                '1',
            ));
            return redirect()->route('encuesta.mostrarAreas');
        }
    }





    // Esta funcion envía los correos a los usuarios permitidos
    protected function enviarCorreo($noEmp)
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
                ));
                
        return "Mensaje enviado";
    }




    public function mostrarAreas()
    {
        return view('areasPreguntasControlador');
    }




    public function agregarArea()
    {
        DB::select('call area_guardar(?,?)',
        array(
            request()->nombre,
            request()->descripcion,
        ));

        $areas = DB::table('areas_de_preguntas')->get();
        $areas = DB::table('areas_de_preguntas')->get();
        return json_encode($areas);
    }




    public function paginaPreguntas()
    {
        $nombreArea = DB::table('areas_de_preguntas')
                        ->select('nombre')
                        ->where('id_area',request()->id)
                        ->first();
        return view('preguntasArea',[
            'id' => request()->id,
            'nombreArea' => $nombreArea->nombre,
        ]);
    }




    public function obtenerTiposRespuesta()
    {
        $tipos = DB::table('tipos_de_respuesta')
                    ->get();
        return $tipos;
    }




    public function verPreguntasAJAX()
    {
        $preguntas = DB::table('preguntas')
                        ->where('id_area',request()->area)->get();
        return $preguntas;
    }




    public function mostrarRespuestasDelTipo()
    {
        $elementos = DB::table('respuestas')
                        ->where('id_tipo',request()->id_tipo)
                        ->get();
        return $elementos;
    }




    public function agregarPreguntaAJAX()
    {
        //$tipo = DB::table('personal')->get();//->where('tipo',request()->tipo);
        DB::select('call pregunta_crear(?,?,?)',
        array(
            request()->area,
            request()->tipo,
            request()->contenido,
        ));

        return "Agregado con exito";
    }



    
    public function agregarRespuesta()
    {
        
        /*DB::select('call respuesta_crear(?,?)',
        array(
            request()->area,
            request()->tipo,
        ));*/

        return response()->json('realizado exitosamente');
    }




    public function destroy($id)
    {
        DB::table('areas_de_preguntas')->where('id_area', '=', $id)->delete();
        $areas = DB::table('areas_de_preguntas')->get();
        return json_encode($areas);
    }




    public function mostrarUsuarios()
    {
        $user = array();
        $user = DB::table('personal')->get();

        return view('usuarios' , [
            'usuarios' => $user
        ]);
    }
}
