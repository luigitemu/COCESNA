<?php

use App\Usuarios;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;  //Manejo de SQL

class UsuariosSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $id1 = DB::table('personal')->get('id_personal');
        $id2 = DB::table('posicion')->get('id_posicion');
        $id3 = DB::table('turnos')->get('id_turno');
        //dd($id1[0]->id_personal);
        //dd($id2);
        for( $i=0 ; $i<count($id1) ; $i++)
        {
            $x = $id2->random()->id_posicion;
            $y = $id3->random()->id_turno;
            factory(Usuarios::class)->create([
                'id_personal' => $id1[$i]->id_personal,
                'id_turno' => $y,
                'id_posicion' => $x
            ]);
        }
    }
}
