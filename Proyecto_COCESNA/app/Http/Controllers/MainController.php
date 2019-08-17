<?php

namespace App\Http\Controllers;

use App\Personal;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB; //Importar DB
use Illuminate\Support\Facades\Crypt; //Encriptar/Desencriptar contraseñas

class MainController extends Controller
{


    public function index()
    {
        return view('iniciarSesion');
    }


    public function paginaLaravel()
    {
        return view('welcome');
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


        //Busca la contraseña perteneciente al numero de empleado y la desencripta
        //se almacena en la variable $pass
        $pass = DB::table('personal')
                ->where('no_empleado',$data['numeroEmpleado'])
                ->first();
        $pass = Crypt::decryptString($pass->contrasena);


        //Compara la contraseña ingresada con la obtenida en la consulta, si son iguales
        //entonces pasa a la pregunta filtro, sino, entonces regresa a iniciar sesion
        //mostrando el error de contraseña incorrecta
        if($pass != $data['contrasena'])
        {
            return back()->withErrors([
                'contrasena'=>'La contraseña es incorrecta',
            ])->withInput();
        }else
        {
            return redirect()->route('encuesta.preguntaFiltro');   
        }    
    }


    public function preguntar()
    {
        return view('preguntaFiltro');
    }


    public function finalizar()
    {
        return view('finEncuesta');
    }

    
}
