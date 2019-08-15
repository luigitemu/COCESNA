<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class UserController extends Controller
{
    public function verificar()
    {
        $data = request()->all();
        //dd($data);
        return redirect()->route('pregunta');
    }

    public function preguntar()
    {
        return view('pregunta');
    }

    public function finalizar()
    {
        return view('finEncuesta');
    }
}
