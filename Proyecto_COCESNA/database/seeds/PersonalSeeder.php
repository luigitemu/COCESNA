<?php

use App\Personal;
use Illuminate\Database\Seeder;

class PersonalSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory(Personal::class)->create([
            'no_empleado'=>'111',
        ]);

        factory(Personal::class)->create([
            'no_empleado'=>'222',
        ]);
        
        factory(Personal::class)->times(8)->create([]);
    }
}
