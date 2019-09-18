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




    // Se encarga de mostrar las areas a los controladores
    public function mostrarAreas()
    {
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




    // Guarda una nueva area hecha por el administrador 
    public function agregarArea(Request $request)
    {
        if(!($request->nombre && $request->descripcion))
        {
            // si alguien intenta ingresar usando la ruta directamente, entonces, retorna 404 pagina no encontrada
            return abort(404);
        }

        DB::select('call area_guardar(?,?)',
        array(
            $request->nombre,
            $request->descripcion,
        ));

        $areas = DB::table('areas_de_preguntas')->get();

        DB::select('call seglog_guardar(?,?,?,?,?,?,?)',
        array(
            $request->session()->get('noEmpleado'),
            $request->session()->get('nombres'),
            'Nueva area',
            'areas_de_preguntas',
            'area_guardar(?,?)',
            'INSERT',
            $request->session()->get('auth'),
        ));

        return json_encode($areas);
    }




    // Borra un area especifica
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

        DB::select('call seglog_guardar(?,?,?,?,?,?,?)',
        array(
            request()->session()->get('noEmpleado'),
            request()->session()->get('nombres'),
            'Borrar area',
            'areas_de_preguntas',
            'Borra el area'.$id,
            'DELETE',
            request()->session()->get('auth'),
        ));

        return json_encode($areas);
    }




    // Muestra las preguntas de un area, de forma sincrona
    public function paginaPreguntas()
    {
        // if(!(request()->session()->get('auth')=='1'))
        // {
        //     return abort(404);
        // }
        if(request()->session()->get('auth')=='1')
        {
            $nombreArea = DB::table('areas_de_preguntas')
                            ->select('nombre')
                            ->where('id_area',request()->id)
                            ->first();

            return view('preguntasArea',[
                'id' => request()->id,
                'nombreArea' => $nombreArea->nombre,
            ]);
        } elseif (request()->session()->get('auth')=='2')
        {
            $nombreArea = DB::table('areas_de_preguntas')
                            ->select('nombre')
                            ->where('id_area',request()->id)
                            ->first();

            $preguntas = DB::table('preguntas')
                            ->select(DB::raw('preguntas.contenido as cuest'),'preguntas.id_tipo')
                            //->select(DB::raw('preguntas.contenido as cuest'),'preguntas.id_tipo','respuestas.contenido')
                            //->Join('respuestas','respuestas.id_tipo','=','preguntas.id_tipo')
                            ->where('id_area',request()->id)
                            ->get();
            
            //return $preguntas;
            $FormatoPreguntas = array();
            foreach ($preguntas as $pregunta) 
            {
                $temp = array();
                $temp['cuest'] = $pregunta->cuest;
                $respuestas = DB::table('respuestas')
                                    ->select('contenido')
                                    ->where('id_tipo',$pregunta->id_tipo)
                                    ->get();
                $respuestas = array_values($respuestas->pluck('contenido')->toArray());
                $temp['respuestas'] = $respuestas;
                //return $temp;
                array_push($FormatoPreguntas,$temp);
            }
            //return $FormatoPreguntas;
            return view('encuesta',[
                'id' => request()->id,
                'nombreArea' => $nombreArea->nombre,
                //'preguntas' => json_encode($FormatoPreguntas),
            ]);
        }
    }




    // Muestra las preguntas de un area, de forma asincrona
    public function verPreguntasAJAX()
    {
        if(request()->session()->get('auth')=='1')
        {
            $preguntas = DB::table('preguntas')
            ->where('id_area',request()->area)->get();
            return $preguntas;

        } elseif (request()->session()->get('auth')=='2')
        {
            $nombreArea = DB::table('areas_de_preguntas')
                            ->select('nombre')
                            ->where('id_area',request()->id)
                            ->first();

            $preguntas = DB::table('preguntas')
                            ->select(DB::raw('preguntas.contenido as cuest'),'preguntas.id_tipo')
                            //->select(DB::raw('preguntas.contenido as cuest'),'preguntas.id_tipo','respuestas.contenido')
                            //->Join('respuestas','respuestas.id_tipo','=','preguntas.id_tipo')
                            ->where('id_area',request()->id)
                            ->get();
            
            //return $preguntas;
            $FormatoPreguntas = array();
            foreach ($preguntas as $pregunta) 
            {
                $temp = array();
                $temp['cuest'] = $pregunta->cuest;
                $respuestas = DB::table('respuestas')
                                    ->select('contenido')
                                    ->where('id_tipo',$pregunta->id_tipo)
                                    ->get();
                $respuestas = array_values($respuestas->pluck('contenido')->toArray());
                $temp['respuestas'] = $respuestas;
                //return $temp;
                array_push($FormatoPreguntas,$temp);
            }
            //return $FormatoPreguntas;
            return [
                'id' => request()->id,
                'nombreArea' => $nombreArea->nombre,
                'preguntas' => $FormatoPreguntas,
            ];
        }

        
        // $preguntas = DB::table('preguntas')
        //                 ->where('id_area',request()->area)->get();
        // return $preguntas;
    }




    // Se guarda una nueva pregunta de un area especifica
    public function agregarPreguntaAJAX()
    {
        if (!(request()->area && request()->tipo && request()->contenido)) 
        {
            return abort(404);
        }

        DB::select('call pregunta_crear(?,?,?)',
        array(
            request()->area,
            request()->tipo,
            request()->contenido,
        ));

        DB::select('call seglog_guardar(?,?,?,?,?,?,?)',
        array(
            request()->session()->get('noEmpleado'),
            request()->session()->get('nombres'),
            'Nueva pregunta',
            'preguntas',
            'pregunta_guardar(?,?)',
            'INSERT',
            request()->session()->get('auth'),
        ));
        return "Agregado con exito";
    }




    // Edita una pregunta especifica
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

        DB::select('call seglog_guardar(?,?,?,?,?,?,?)',
        array(
            request()->session()->get('noEmpleado'),
            request()->session()->get('nombres'),
            'Actualizar pregunta',
            'preguntas',
            'Actualizar pregunta '.request()->id. ' usando el contenido "'.request()->contenido.'" y el tipo "'.request()->tipo.'"',
            'UPDATE',
            request()->session()->get('auth'),
        ));

        return request();
    }




    // Borra una determinada pregunta
    public function borrarPregunta()
    {
        if(!request()->id)
        {
            return abort(404);
        }

        DB::table('preguntas')
            ->where('id_pregunta', request()->id)
            ->delete();

        DB::select('call seglog_guardar(?,?,?,?,?,?,?)',
        array(
            request()->session()->get('noEmpleado'),
            request()->session()->get('nombres'),
            'Borrar pregunta',
            'preguntas',
            'Borra la pregunta '.request()->id,
            'DELETE',
            request()->session()->get('auth'),
        ));

        return request();
    }




    // Retorna los tipos de respuesta existentes en la base de datos
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




    // Muestra las respuestas de una pregunta
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




}
