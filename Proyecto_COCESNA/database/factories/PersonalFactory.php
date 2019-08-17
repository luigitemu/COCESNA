<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Personal;
use Faker\Generator as Faker;
use Illuminate\Support\Facades\Crypt;

$factory->define(Personal::class, function (Faker $faker) {
    return [
        'nombres' => $faker->sentence(1),
        'apellidos' => $faker->sentence(1),
        'fecha_nacimiento' => $faker->date($format = 'Y-m-d', $max = 'now'),
        'fecha_ingreso' => $faker->date($format = 'Y-m-d', $max = 'now'),
        'sexo' => rand(1,2),
        'no_empleado' => $faker->unique()->randomNumber($nbDigits = 3),
        'contrasena' => $encrypted = Crypt::encryptString('0000'),
        //'contrasena' => $faker->word(),
    ];
});
