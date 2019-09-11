<?php

namespace App\Http\Controllers;

use App\Personal;
use App\Usuarios;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;      // Importar DB
use Illuminate\Support\Facades\Crypt;   // Encriptar/Desencriptar contraseñas
use Illuminate\Support\Facades\Hash;    // Manejo de hashes
use Mail;
use App\Mail\SendMailable;

class AreaController extends Controller
{




    public function mostrarAreas()
    {
        //request()->session()->flush();
        if(!(request()->session()->get('auth')=='2'))
        {
            return redirect()->route('sistema.inicio');   
        }

        $areas  = array();
        $areas = DB::table('areas_de_preguntas')->get();
        return view('areasPreguntasControlador', [
            'areas'=> $areas
        ]);
    }




    public function agregarArea()
    {
        if(!(request()->nombre && request()->descripcion))
        {
            // si alguien intenta ingresar usando la ruta directamente, entonces, retorna 404 pagina no encontrada
            return abort(404);
        }

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
        if(!(request()->session()->get('auth')=='1'))
        {
            return abort(404);
        }
        $nombreArea = DB::table('areas_de_preguntas')
                        ->select('nombre')
                        ->where('id_area',request()->id)
                        ->first();
        return view('preguntasArea',[
            'id' => request()->id,
            'nombreArea' => $nombreArea->nombre,
        ]);
    }




    public function verPreguntasAJAX()
    {
        $preguntas = DB::table('preguntas')
                        ->where('id_area',request()->area)->get();
        return $preguntas;
    }




    public function agregarPreguntaAJAX()
    {
        if (!(request()->area && request()->tipo && request()->contenido)) 
        {
            return abort(404);
        }
        //$tipo = DB::table('personal')->get();//->where('tipo',request()->tipo);
        DB::select('call pregunta_crear(?,?,?)',
        array(
            request()->area,
            request()->tipo,
            request()->contenido,
        ));
        return "Agregado con exito";
    }




    public function actualizarPregunta()
    {
        if(!(request()->session()->get('auth')=='1'))
        {
            return abort(404);
        }
        DB::table('preguntas')
            ->where('id_pregunta', request()->id)
            ->update([
                'contenido' => request()->contenido,
                'id_tipo' => request()->tipo,
            ]);
        return request();
    }




    public function borrarPregunta()
    {
        if(!request()->id)
        {
            return abort(404);
        }

        DB::table('preguntas')
            ->where('id_pregunta', request()->id)
            ->delete();
        return request();
    }




    public function obtenerTiposRespuesta()
    {
        if(!(request()->session()->get('auth')=='1'))
        {
            return abort(404);
        }

        $tipos = DB::table('tipos_de_respuesta')
                    ->get();
        return $tipos;
    }




    public function mostrarRespuestasDelTipo()
    {
        if (!request()->id_tipo) 
        {
            return abort(404);
        }

        $elementos = DB::table('respuestas')
                    ->where('id_tipo',request()->id_tipo)
                    ->get();
        return $elementos;
        
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




    public function borrarArea($id)
    {
        if(!(request()->session()->get('auth')=='1'))
        {
            return abort(404);
        }

        DB::table('preguntas')
            ->where('id_area', '=', $id)
            ->delete();
        DB::table('areas_de_preguntas')
            ->where('id_area', '=', $id)
            ->delete();
        $areas = DB::table('areas_de_preguntas')
                    ->get();
        return json_encode($areas);
    }




}
