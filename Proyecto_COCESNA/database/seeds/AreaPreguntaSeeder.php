<?php

use App\AreaPregunta;
use Illuminate\Database\Seeder;

class AreaPreguntaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory(AreaPregunta::class)->create([
            'nombre' => 'Fatiga',
            'descripcion' => 'Lorem ipsum dolor sit amet',
        ]);
    }
}
