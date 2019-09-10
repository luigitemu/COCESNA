<?php

namespace App\Http\Controllers;

use App\Personal;
use App\Usuarios;
use App\Charts\UsersChart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB; // Importar DB
use Illuminate\Support\Facades\Crypt; // Encriptar/Desencriptar contraseñas
use Illuminate\Support\Facades\Hash;  // Manejo de hashes
use App\Mail\SendMailable;


class ReportesController extends Controller
{
    public function mostrar()
    {
        // if(request()->session()->get('auth')!='1')
        // {
        //     return redirect()->route('sistema.inicio');
        // }

        // obtenemos la informacion de la base de datos
        $generos = DB::table('personal')
                        ->select('sexo')
                        ->get();
        $cantidadM = DB::table('personal')->where('sexo','M')->count();
        $cantidadF = DB::table('personal')->where('sexo','F')->count();

        // obtenemos los colores para el grafico
        $colores = $this->colores_aleatorios(count($generos));

        // creamos el grafico
        $chart1 = new UsersChart;
        
        // definimos un arreglo con las etiquetas que lleva le eje X
        $eje_x_etiquetas = ['Hombres','Mujeres'];      
        $chart1->labels($eje_x_etiquetas);
        $chart1->options([
            'title' => collect([
                'display' => 'true',
                'text' => 'Cantidad de hombres y mujeres'
            ]),
        ]);

        // definimos un arreglo con las etiquetas que lleva le eje Y
        $eje_y_numerico = [$cantidadM,$cantidadF];

        // definimos los colores por cada etiqueta
        $dataset = $chart1->dataset('chart_1','pie',$eje_y_numerico);
        $dataset->backgroundColor($colores);
        $dataset->color($colores);
        

        // para el segundo grafico se obtiene cuantas personas hay de cada posicion
        $posiciones = DB::table('posicion')
                        ->select('posicion')
                        ->get();
        $posiciones = array_values($posiciones->pluck('posicion')->toArray());
        $usuarios_x_posicion = DB::table('usuarios')
                                ->select('id_posicion',DB::raw('count(*) as total'))
                                ->groupBy('id_posicion')
                                ->get();
        $usuarios_x_posicion = array_values($usuarios_x_posicion->pluck('total')->toArray());

        // obtenemos los colores para el grafico
        $colores = $this->colores_aleatorios(count($posiciones));

        // creamos el objeto chart
        $chart2 = new UsersChart();
        $chart2->labels($posiciones);
        $dataset = $chart2->dataset('','bar',$usuarios_x_posicion);
        $dataset->backgroundColor($colores);
        $chart2->options([
            'legend' => collect([
                'display' => false,
            ]),
            'title' => collect([
                'display' => 'true',
                'text' => 'Cantidad de usuarios por posición'
            ]),
        ]);


        // Para el tercer grafico se obtiene cuantas personas tienen un numero de empleado
        // mayor a 500 y cuantas personas tienen un numero de empleado menor o igual a 500
        $etiquetas = ['Numero de empleado mayor a 500','numero de empleado menor a 500'];
        $menores_500 = DB::table('personal')
                                ->select('no_empleado')
                                ->whereRaw('no_empleado <= 500')
                                ->count();
        $mayores_a_500 = DB::table('personal')
                            ->select('no_empleado')
                            ->whereRaw('no_empleado > 500')
                            ->count();
        
        // obtenemos los colores para el grafico
        $colores = $this->colores_aleatorios(count($etiquetas));

        // creamos el objeto chart
        $chart3 = new UsersChart();
        $chart3->labels($etiquetas);
        $dataset = $chart3->dataset('d','doughnut',[$mayores_a_500,$menores_500]);
        $dataset->backgroundColor($colores);
        $chart3->options([
            'legend' => collect([
                'display' => false,
            ]),
            'title' => collect([
                'display' => true,
                'text' => 'Clasificación de usuarios por su número de empleado'
            ]),
        ]);

        return view('reportesCreados',compact('chart1','chart2','chart3'));
    }




    protected function colores_aleatorios($cantidad)
    {
        $colores = collect();
        for ($i=0; $i < $cantidad; $i++) { 
            $colores->push('#'.$this->random_color());
        }
        return $colores;
    }
    protected function random_color() {
        return $this->random_color_part() . $this->random_color_part() . $this->random_color_part();
    }
    protected function random_color_part() {
        return str_pad( dechex( mt_rand( 0, 255 ) ), 2, '0', STR_PAD_LEFT);
    }
}
