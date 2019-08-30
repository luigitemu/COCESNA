<?php


use App\Pregunta;
use Illuminate\Database\Seeder;

class PreguntaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory(Pregunta::class)->create([
            'contenido' => '¿Existes?',
            'id_tipo' => '1',
            'id_area' => '1',
        ]);
        factory(Pregunta::class)->create([
            'contenido' => '¿Cómo está el calor?',
            'id_tipo' => '3',
            'id_area' => '1',
        ]);
    }
}
