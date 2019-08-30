<?php

use App\TiposRespuesta;
use Illuminate\Database\Seeder;

class TiposRespuestaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory(TiposRespuesta::class)->create([
            'tipo' => 'Cerrada'
        ]);
        factory(TiposRespuesta::class)->create([
            'tipo' => 'Escala numerica 1-5'
        ]);
        factory(TiposRespuesta::class)->create([
            'tipo' => 'Escala ordinal'
        ]);
        
    }
}
