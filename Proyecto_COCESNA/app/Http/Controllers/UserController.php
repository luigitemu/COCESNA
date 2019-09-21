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
                        ->join('personal' , 'usuarios.id_personal' ,'=' ,'personal.id_personal')
                        ->join('turnos' , 'turnos.id_turno','=','usuarios.id_turno')
                        ->select('personal.no_empleado' , 'usuarios.email', 'personal.nombres' , 'personal.apellidos','turnos.turno' )
                        ->orderBy('personal.no_empleado')
                        ->get();
        $personal = DB::table('personal')
                        ->orderBy('no_empleado','asc')
                        ->get();
        $turnos = DB::table('turnos')
                        ->get();
        return view('usuarios' , [
            'usuarios' => $user,
            'personal' => $personal,
            'turnos' => $turnos,
        ]);
    }




    public function destroyUser($id)
    {
        if(!(request()->session()->get('auth')=='1'))
        {
            return abort(404);
        }

        DB::table('usuarios')->where('id_personal' , '=' , $id)->delete();
        $usuarios = DB::table('usuarios')
                        ->join('personal' , 'usuarios.id_personal' ,'=' ,'personal.id_personal')
                        ->join('turnos' , 'turnos.id_turno','=','usuarios.id_turno')
                        ->select('usuarios.id_personal' , 'usuarios.email', 'personal.nombres' , 'personal.apellidos','turnos.turno' )
                        ->orderBy('usuarios.id_personal')
                        ->get();
        return json_encode($usuarios);
    }




}
