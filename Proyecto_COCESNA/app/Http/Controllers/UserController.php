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

class UserController extends Controller
{




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
        return view('usuarios' , [
            'usuarios' => $user,
            'personal' => $personal,
            'posiciones' => $posicion,
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




}
