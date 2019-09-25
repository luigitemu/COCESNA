<?php

namespace App\Http\Controllers;

use App\Personal;
use App\Usuarios;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;      //Importar DB
use Illuminate\Support\Facades\Crypt;   //Encriptar/Desencriptar contraseñas
use Illuminate\Support\Facades\Hash;    //Manejo de hashes
use Mail;
use App\Mail\SendMailable;

class UserController extends Controller
{




    // De https://gist.github.com/yoga-/8c2c196173be3d4aff56
    //  generates a random password of length minimum 8 
    //  contains at least one lower case letter, one upper case letter,
    // one number and one special character, 
    //  not including ambiguous characters like iIl|1 0oO 
    protected function randomPassword($len = 8) 
    {
        //  enforce min length 8
        if($len < 8)
            $len = 8;
        //  define character libraries - remove ambiguous characters like iIl|1 0oO
        $sets = array();
        $sets[] = 'ABCDEFGHJKLMNPQRSTUVWXYZ';
        $sets[] = 'abcdefghjkmnpqrstuvwxyz';
        $sets[] = '23456789';
        $sets[]  = '~!@#$%^&*(){}[],./?';
        $password = '';
        //  append a character from each set - gets first 4 characters
        foreach ($sets as $set) {
            $password .= $set[array_rand(str_split($set))];
        }
        //  use all characters to fill up to $len
        while(strlen($password) < $len) {
            //  get a random set
            $randomSet = $sets[array_rand($sets)];   
            //  add a random char from the random set
            $password .= $randomSet[array_rand(str_split($randomSet))]; 
        }
        //  shuffle the password string before returning!
        return str_shuffle($password);
    }




    public function agregarUsuario(Request $request)
    {
        if(!($request->session()->get('auth')=='1'))
        {
            return abort(404);
        }

        $idPersonal = DB::table('personal')
                        ->select('id_personal')
                        ->where('no_empleado','=',$request->no_empleado)
                        ->first();

        $idTurno = DB::table('turnos')
                        ->select('id_turno')
                        ->where('id_turno','=',$request->turno)
                        ->first();

        $idPosicion = DB::table('posicion')
                        ->select('id_posicion')
                        ->where('id_posicion','=',$request->posicion)
                        ->first();

        DB::select('call usuarios_guardar(?,?,?,?,?)',
        array(
            $idPersonal->id_personal,
            $idTurno->id_turno,
            $idPosicion->id_posicion,
            $request->email,
            Crypt::encryptString('123'),
        ));

        $user = array();
        $user = DB::table('usuarios')
                        ->select('personal.no_empleado' , 'usuarios.email', 'personal.nombres' , 'personal.apellidos','posicion.posicion' )
                        ->join('personal','usuarios.id_personal','=','personal.id_personal')
                        ->join('posicion','posicion.id_posicion','=','usuarios.id_posicion')
                        ->orderBy('personal.no_empleado')
                        ->get();

        // return $this->randomPassword();
        return $user;
    }




    public function mostrarUsuarios()
    {
        if(!(request()->session()->get('auth')=='1'))
        {
            return abort(404);
        }
        $user = array();
        $user = DB::table('usuarios')
                        ->select('personal.no_empleado' , 'usuarios.email', 'personal.nombres' , 'personal.apellidos','posicion.posicion' )
                        ->join('personal' , 'usuarios.id_personal' ,'=' ,'personal.id_personal')
                        ->join('posicion' , 'posicion.id_posicion','=','usuarios.id_posicion')
                        ->orderBy('personal.no_empleado')
                        ->get();

        $personal = DB::table('personal')
                        ->orderBy('no_empleado','asc')
                        ->get();

        $posicion = DB::table('posicion')
                        ->get();

        $turnos = DB::table('turnos')
                        ->get();

        $disponibles = DB::table('personal')
                        ->select('personal.no_empleado')
                        ->leftJoin('usuarios','personal.id_personal','=','usuarios.id_personal')
                        ->whereNull('usuarios.id_personal')
                        ->orderBy('personal.no_empleado')
                        ->get();

        // dd($disponibles);
        return view('usuarios' , [
            'usuarios' => $user,
            'personal' => $personal,
            'id_disponibles' => $disponibles,
            'posiciones' => $posicion,
            'turnos' =>$turnos,
        ]);
    }




    public function actualizarUsuario(Request $request)
    {
        if(!($request->session()->get('auth')=='1'))
        {
            return abort(404);
        }

        $idPersonal = DB::table('personal')
                        ->select('id_personal')
                        ->where('no_empleado','=',$request->no_empleado)
                        ->first();

        $posicion = DB::table('posicion')
                        ->select('id_posicion')
                        ->where('posicion','=',$request->posicion)
                        ->first();
        
         DB::table('usuarios')
            ->where('id_personal','=',$idPersonal->id_personal)
            ->update([
                'id_posicion' => $posicion->id_posicion,
                'email' => $request->email,
            ]);

            $usuarios = DB::table('usuarios')
                        ->select('personal.no_empleado' , 'usuarios.email', 'personal.nombres' , 'personal.apellidos','posicion.posicion' )
                        ->join('personal' , 'usuarios.id_personal' ,'=' ,'personal.id_personal')
                        ->join('posicion' , 'posicion.id_posicion','=','usuarios.id_posicion')
                        ->orderBy('personal.no_empleado')
                        ->get();

        return json_encode($usuarios);
    }




    public function destroyUser($id)
    {
        if(!(request()->session()->get('auth')=='1'))
        {
            return abort(404);
        }

        $idPersonal = DB::table('personal')
                        ->select('id_personal')
                        ->where('no_empleado','=',$id)
                        ->first();

         DB::table('usuarios')->where('id_personal' , '=' , $idPersonal->id_personal)->delete();

         $usuarios = DB::table('usuarios')
                        ->select('personal.no_empleado' , 'usuarios.email', 'personal.nombres' , 'personal.apellidos','posicion.posicion' )
                        ->join('personal' , 'usuarios.id_personal' ,'=' ,'personal.id_personal')
                        ->join('posicion' , 'posicion.id_posicion','=','usuarios.id_posicion')
                        ->orderBy('personal.no_empleado')
                        ->get();

        return json_encode($usuarios);
    }


    public function cambiarContrasena(Request $request)
    {
        if(!(request()->session()->get('auth')=='2'))
        {
            return abort(404);
        }
        // Yu10fWWTWv
        // $cadena = str_random(10);
        // $RandomPassword = Crypt::encryptString($cadena);

        // $RandomPassword = Crypt::encryptString('2');

        $idPersonal = DB::table('personal')
                        ->select('id_personal')
                        ->where('no_empleado','=',$request->noEmp)
                        ->first();

        DB::table('usuarios')
            ->where('id_personal','=',$idPersonal->id_personal)
            ->update([
                // 'contrasena' => $RandomPassword,
                'contrasena' => Crypt::encryptString($request->contrasena),
            ]);
        // return 'Cambio de contraseña exitoso, contraseña: '.$cadena;
        // return 'Cambio de contraseña exitoso, contraseña: 2';
        return $request;
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




}
