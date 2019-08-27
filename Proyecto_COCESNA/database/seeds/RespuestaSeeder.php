<?php

use App\Respuesta;
use Illuminate\Database\Seeder;

class RespuestaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory(Respuesta::class)->create([
            'contenido' => 'si'
        ]);
        factory(Respuesta::class)->create([
            'contenido' => 'no'
        ]);
    }
}
