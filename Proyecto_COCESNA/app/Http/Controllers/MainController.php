<?php

namespace App\Http\Controllers;

use App\Personal;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB; //Importar DB

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
        $data = request()->validate([
            'numeroEmpleado' => ['required','exists:personal,no_empleado'], //verifica si existe el numero de empleado en la tabla personal, en la columna no_empleado
            'contrasena' => ['required'],
        ],[
            'numeroEmpleado.required' => 'El número de empleado es obligatorio',
            'numeroEmpleado.exists' => 'El número de empleado es invalido',
            'contrasena.required' => 'La contraseña es obligatoria',
        ]);
        return redirect()->route('encuesta.preguntaFiltro');
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
