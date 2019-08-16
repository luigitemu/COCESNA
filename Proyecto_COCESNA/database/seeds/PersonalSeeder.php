<?php

use App\Personal;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;  //Manejo de SQL

class PersonalSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $porCrear = 10;         //numero de filas
        $combinaciones = [];
        //factory(ClasesXAlumno::class)->times(30)->create([]);
        $id1 = DB::table('turnos')->get('id_turno');
        //dd($idAlumnos);
        $id2 = DB::table('posicion')->get('id_posicion');
        //dd($idClases);
        
        for( $i=0 ; $i<$porCrear ; $i++)
        {
            $x = $id1->random()->id_turno;
            $y = $id2->random()->id_posicion;
            factory(Personal::class)->create([
                'id_turno' => $x,
                'id_posicion' => $y
            ]);
        }
    }
}
