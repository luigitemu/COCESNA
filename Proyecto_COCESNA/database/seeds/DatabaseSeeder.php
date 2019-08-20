<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        //llamamos a una funcion la cual se encarga de borrar los registros en las tablas mencionadas
        $this->truncateTables([
            'posicion',
            'turnos',
            'personal',
            'user',
        ]);


        //llamamos a los seeders de cada entidad
        $this->call(PosicionSeeder::class);
        $this->call(TurnoSeeder::class);
        $this->call(PersonalSeeder::class);
    }

    //Esta funcion se encarga de borrar los registros de las tablas
    protected function truncateTables(array $tables){
        DB::statement('SET FOREIGN_KEY_CHECKS = 0');
        foreach ($tables as $table) {
            DB::table($table)->truncate();
        }
        DB::statement('SET FOREIGN_KEY_CHECKS = 1');
    }
}
