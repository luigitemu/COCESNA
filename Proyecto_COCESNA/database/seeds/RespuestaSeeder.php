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
            'contenido' => 'si',
            'id_tipo' => '1',
        ]);
        factory(Respuesta::class)->create([
            'contenido' => 'no',
            'id_tipo' => '1',
        ]);
        factory(Respuesta::class)->create([
            'contenido' => '1',
            'id_tipo' => '2',
        ]);
        factory(Respuesta::class)->create([
            'contenido' => '2',
            'id_tipo' => '2',
        ]);
        factory(Respuesta::class)->create([
            'contenido' => '3',
            'id_tipo' => '2',
        ]);
        factory(Respuesta::class)->create([
            'contenido' => '4',
            'id_tipo' => '2',
        ]);
        factory(Respuesta::class)->create([
            'contenido' => '5',
            'id_tipo' => '2',
        ]);
        factory(Respuesta::class)->create([
            'contenido' => 'bajo',
            'id_tipo' => '3',
        ]);
        factory(Respuesta::class)->create([
            'contenido' => 'medio',
            'id_tipo' => '3',
        ]);
        factory(Respuesta::class)->create([
            'contenido' => 'alto',
            'id_tipo' => '3',
        ]);
    }
}
