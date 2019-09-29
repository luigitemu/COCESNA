<?php

namespace App\Http\Controllers;

use App\Personal;
use App\Usuarios;
use App\Charts\UsersChart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;      // Importar DB
use Illuminate\Support\Facades\Crypt;   // Encriptar/Desencriptar contraseñas
use Illuminate\Support\Facades\Hash;    // Manejo de hashes


class ReportesController extends Controller
{




    // Muestra determinados reportes
    public function mostrar()
    {
        if(request()->session()->get('auth')!='1')
        {
            return redirect()->route('sistema.inicio');
        }

        // // obtenemos la informacion de la base de datos
        // $generos = DB::table('personal')
            
        //                 ->select('sexo')
        //                 ->get();
        // $cantidadM = DB::table('personal')->where('sexo','M')->count();
        // $cantidadF = DB::table('personal')->where('sexo','F')->count();

        // // obtenemos los colores para el grafico
        // $colores = $this->colores_aleatorios(count($generos));

        // // creamos el grafico
        // $chart1 = new UsersChart;
        
        // // definimos un arreglo con las etiquetas que lleva le eje X
        // $eje_x_etiquetas = ['Hombres','Mujeres'];      
        // $chart1->labels($eje_x_etiquetas);
        // $chart1->options([
        //     'title' => collect([
        //         'display' => 'true',
        //         'text' => 'Cantidad de hombres y mujeres'
        //     ]),
        // ]);

        // // definimos un arreglo con las etiquetas que lleva le eje Y
        // $eje_y_numerico = [$cantidadM,$cantidadF];

        // // definimos los colores por cada etiqueta
        // $dataset = $chart1->dataset('chart_1','pie',$eje_y_numerico);
        // $dataset->backgroundColor($colores);
        // $dataset->color($colores);



        // // obtenemos la informacion de la base de datos
        // $usuarios = DB::table('personal')
            
        //                 ->select(DB::raw('YEAR(fecha_ingreso) as año'), DB::raw('count(*) as cantidad'))
        //                 ->groupBy(DB::raw('YEAR(fecha_ingreso)'))
        //                 ->orderBy('año')
        //                 ->get();
        // $cantidades = array_values($usuarios->pluck('cantidad')->toArray()); 
        // $usuarios = array_values($usuarios->pluck('año')->toArray());
        // // dd($cantidades);
        // // dd($usuarios);
        // // obtenemos los colores para el grafico
        // $colores = $this->colores_aleatorios(1);

        // // creamos el grafico
        // $chart1 = new UsersChart;
        
        // // definimos un arreglo con las etiquetas que lleva le eje X
        // $eje_x_etiquetas = $usuarios;      
        // $chart1->labels($eje_x_etiquetas);
        // $chart1->options([
        //     'legend' => collect([
        //         'display' => false,
        //     ]),
        //     'title' => collect([
        //         'display' => 'true',
        //         'text' => 'Cantidad de empleados agregados por año'
        //     ]),
        // ]);

        // definimos un arreglo con las etiquetas que lleva le eje Y
        // $eje_y_numerico = $cantidades;

        // // definimos los colores por cada etiqueta
        // $dataset = $chart1->dataset('','line',$eje_y_numerico);
        // $dataset->fill(false);
        // $dataset->color($colores[0]);
        // $dataset->lineTension(0.1);



        // Para el cuarto grafico se cuenta las veces que han respondido "si" y "no" en la 
        // pregunta filtro
        $etiquetas = ['Contestaron "SI"','Contestaron "NO"'];
        $cantidad = DB::table('log_usuarios')
                            ->select('id_respuesta',DB::raw('count(id_respuesta) as total'))
                            ->where('es_pregunta_filtro','=','1')
                            ->groupBy('id_respuesta')
                            ->orderBy('id_respuesta')
                            ->get();
                            // dd($cantidad);
        $cantidad = array_values($cantidad->pluck('total')->toArray());
        // dd($cantidad);
        // obtenemos los colores para el grafico
        $colores = $this->colores_aleatorios(count($etiquetas));

        // creamos el objeto chart
        $chart1 = new UsersChart();
        $chart1->labels($etiquetas);
        $dataset = $chart1->dataset('ed','polarArea',$cantidad);
        $dataset->backgroundColor($colores);
        $chart1->options([
            'legend' => collect([
                'display' => false,
            ]),
            'title' => collect([
                'display' => true,
                'text' => 'Cantidad de veces que han respondido "si" y "no" a la pregunta filtro'
            ]),
        ]);

        

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



        // para el tercer grafico se obtiene cuantos usuarios hay de cada turno
        $posiciones = DB::table('turnos')
                        ->select('turno')
                        ->get();
        $posiciones = array_values($posiciones->pluck('turno')->toArray());
        $usuarios_x_posicion = DB::table('usuarios')
                                ->select('id_turno',DB::raw('count(*) as total'))
                                ->groupBy('id_turno')
                                ->get();
        $usuarios_x_posicion = array_values($usuarios_x_posicion->pluck('total')->toArray());

        // obtenemos los colores para el grafico
        $colores = $this->colores_aleatorios(count($posiciones));

        // creamos el objeto chart
        $chart3 = new UsersChart();
        $chart3->labels($posiciones);
        $dataset = $chart3->dataset('','bar',$usuarios_x_posicion);
        $dataset->backgroundColor($colores);
        $chart3->options([
            'legend' => collect([
                'display' => false,
            ]),
            'title' => collect([
                'display' => 'true',
                'text' => 'Cantidad de usuarios por turno'
            ]),
        ]);



        // // Para el tercer grafico se obtiene cuantas personas tienen un numero de empleado
        // // mayor a 500 y cuantas personas tienen un numero de empleado menor o igual a 500
        // $etiquetas = ['Numero de empleado mayor a 500','numero de empleado menor a 500'];
        // $menores_500 = DB::table('personal')
        //                         ->select('no_empleado')
        //                         ->whereRaw('no_empleado <= 500')
        //                         ->count();
        // $mayores_a_500 = DB::table('personal')
        //                     ->select('no_empleado')
        //                     ->whereRaw('no_empleado > 500')
        //                     ->count();
        
        // // obtenemos los colores para el grafico
        // $colores = $this->colores_aleatorios(count($etiquetas));

        // // creamos el objeto chart
        // $chart3 = new UsersChart();
        // $chart3->labels($etiquetas);
        // $dataset = $chart3->dataset('d','doughnut',[$mayores_a_500,$menores_500]);
        // $dataset->backgroundColor($colores);
        // $chart3->options([
        //     'legend' => collect([
        //         'display' => false,
        //     ]),
        //     'title' => collect([
        //         'display' => true,
        //         'text' => 'Clasificación de usuarios por su número de empleado'
        //     ]),
        // ]);



        // Para el cuarto grafico se cuenta las preguntas que tiene cada area 
        $cantidad = DB::table('preguntas')
                            ->select('areas_de_preguntas.nombre',DB::raw('count(*) as total'))
                            ->join('areas_de_preguntas','preguntas.id_area','=','areas_de_preguntas.id_area')
                            ->groupBy('areas_de_preguntas.id_area')
                            ->get();

        $etiquetas = array_values($cantidad->pluck('nombre')->toArray());
        $cantidad = array_values($cantidad->pluck('total')->toArray());
        // obtenemos los colores para el grafico
        $colores = $this->colores_aleatorios(count($etiquetas));

        // creamos el objeto chart
        $chart4 = new UsersChart();
        $chart4->labels($etiquetas);
        $dataset = $chart4->dataset('df','polarArea',$cantidad);
        $dataset->backgroundColor($colores);
        $chart4->options([
            'legend' => collect([
                'display' => false,
            ]),
            'title' => collect([
                'display' => true,
                'text' => 'Cantidad de preguntas por area'
            ]),
        ]);



        // Para el quinto grafico se cuenta las preguntas respondidas por áreas 
        $cantidad = DB::table('log_usuarios')
                            ->select('areas_de_preguntas.nombre',DB::raw('count(*) as total'))
                            ->join('areas_de_preguntas','log_usuarios.id_area','=','areas_de_preguntas.id_area')
                            ->where('es_pregunta_filtro','=','0')
                            ->groupBy('areas_de_preguntas.id_area')
                            ->get();

        $etiquetas = array_values($cantidad->pluck('nombre')->toArray());
        $cantidad = array_values($cantidad->pluck('total')->toArray());
        // obtenemos los colores para el grafico
        $colores = $this->colores_aleatorios(count($etiquetas));

        // creamos el objeto chart
        $chart5 = new UsersChart();
        $chart5->labels($etiquetas);
        $dataset = $chart5->dataset('sd','doughnut',$cantidad);
        $dataset->backgroundColor($colores);
        $dataset->color($colores);
        $chart5->options([
            'legend' => collect([
                'display' => false,
            ]),
            'title' => collect([
                'display' => true,
                'text' => 'Cantidad de preguntas respondidas por área'
            ]),
        ]);



        // Para el sexto grafico se muestra las horas que mas se usa el sistema 
        $cantidad = DB::table('user')
                            ->select(DB::raw('DATE_FORMAT(FROM_UNIXTIME(created_at), "%H") as hora'),DB::raw('count(*) as total'))
                            ->groupBy('hora')
                            ->get();
                // dd($cantidad);
        $etiquetas = array_values($cantidad->pluck('hora')->toArray());
        $cantidad = array_values($cantidad->pluck('total')->toArray());
        // obtenemos los colores para el grafico
        $colores = $this->colores_aleatorios(count($etiquetas));

        // creamos el objeto chart
        $chart6 = new UsersChart();
        $chart6->labels($etiquetas);
        $dataset = $chart6->dataset('Ingresos','line',$cantidad);
        $dataset->fill(false);
        $dataset->color($colores[0]);
        $dataset->lineTension(0.1);
        $chart6->options([
            'legend' => collect([
                'display' => false,
            ]),
            'title' => collect([
                'display' => true,
                'text' => 'Horas de mayor uso del sistema'
            ]),
        ]);



        // Para el septimo grafico se muestra las veces que cada usuario ha ingresado al sistema 
        $cantidad = DB::table('user')
                            ->select('username',DB::raw('count(*) as total'))
                            ->groupBy('username')
                            ->get();
                // dd($cantidad);
        $etiquetas = array_values($cantidad->pluck('username')->toArray());
        $cantidad = array_values($cantidad->pluck('total')->toArray());
        // obtenemos los colores para el grafico
        $colores = $this->colores_aleatorios(count($etiquetas));

        // creamos el objeto chart
        $chart7 = new UsersChart();
        $chart7->labels($etiquetas);
        $dataset = $chart7->dataset('qs','pie',$cantidad);
        $dataset->backgroundColor($colores);
        $dataset->color($colores);
        $chart7->options([
            'legend' => collect([
                'display' => false,
            ]),
            'title' => collect([
                'display' => true,
                'text' => 'Ingresos al sistema por usuario'
            ]),
        ]);
        
        

        // Para el octavo grafico se muestra el uso del sistema por meses 
        $cantidad = DB::table('user')
                            ->select(DB::raw('DATE_FORMAT(FROM_UNIXTIME(created_at), "%m") as mes'),DB::raw('count(*) as total'))
                            ->groupBy('mes')
                            ->get();
                // dd($cantidad);
        $etiquetas = array_values($cantidad->pluck('mes')->toArray());
        $cantidad = array_values($cantidad->pluck('total')->toArray());
        // obtenemos los colores para el grafico
        $colores = $this->colores_aleatorios(count($etiquetas));

        // creamos el objeto chart
        $chart8 = new UsersChart();
        $chart8->labels($etiquetas);
        $dataset = $chart8->dataset('Ingresos','bar',$cantidad);
        $dataset->backgroundColor($colores);
        $chart8->options([
            'legend' => collect([
                'display' => false,
            ]),
            'title' => collect([
                'display' => true,
                'text' => 'Uso del sistema por meses'
            ]),
        ]);

        

        // Para el noveno grafico se muestra las cantidades de registros de las tablas aisladas 
        $PerConRep = DB::table('perdidas_de_contrasena')
                            ->select(DB::raw('count(id_perdida) as total'))
                            ->first();
        $ModPreFil = DB::table('pregunta_filtro')
                            ->select(DB::raw('count(id_pregunta)-1 as total'))
                            ->first();
        $RazEncCon = DB::table('razones')
                            ->select(DB::raw('count(id_razon) as total'))
                            ->first();
                // dd($PerConRep);
                // dd($ModPreFil);
                // dd($RazEncCon);
        $etiquetas = ['Perdidas de contraseñas reportadas','Veces que la pregunta filtro ha sido modificada','Razones para llenar la encuesta de un controlador'];
        $ejeY = [$PerConRep->total,$ModPreFil->total,$RazEncCon->total];
        // obtenemos los colores para el grafico
        $colores = $this->colores_aleatorios(count($etiquetas));

        // creamos el objeto chart
        $chart9 = new UsersChart();
        $chart9->labels($etiquetas);
        $dataset = $chart9->dataset('','bar',$ejeY);
        $dataset->backgroundColor($colores);
        $chart9->options([
            'legend' => collect([
                'display' => false,
            ]),
            'title' => collect([
                'display' => true,
                'text' => 'Otros datos importantes'
            ]),
        ]);
        



        return view('reportesCreados',[
            'reportes' => compact(
                'chart1','chart2',
                'chart3','chart4',
                'chart5','chart6',
                'chart7','chart8',
                'chart9'
            )
        ]);
    }




    // Permite obtener determinada cantidad de colores aleatorios
    protected function colores_aleatorios($cantidad)
    {
        $colores = collect();
        for ($i=0; $i < $cantidad; $i++) 
        { 
            $colores->push('#'.$this->random_color());
        }
        return $colores;
    }
    protected function random_color() 
    {
        return $this->random_color_part() . $this->random_color_part() . $this->random_color_part();
    }
    protected function random_color_part() 
    {
        return str_pad( dechex( mt_rand( 0, 255 ) ), 2, '0', STR_PAD_LEFT);
    }
}
