<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Personal;
use Faker\Generator as Faker;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Hash;

$factory->define(Personal::class, function (Faker $faker) {
    return [
        'nombres' => $faker->sentence(1),
        'apellidos' => $faker->sentence(1),
        'fecha_nacimiento' => $faker->date($format = 'Y-m-d', $max = 'now'),
        'fecha_ingreso' => $faker->date($format = 'Y-m-d', $max = 'now'),
        'sexo' => rand(1,2),
        'no_empleado' => $faker->unique()->randomNumber($nbDigits = 3),
        'contrasena' => Metodos::encryptPassword('0000'),
    ];
});

class Metodos
{
    Public static function randomPassword()
    {
        return $faker->word();
    }

    Public static function encryptPassword($datos)
    {
        return Crypt::encryptString($datos);
    }

    Public static function hashPassword($datos)
    {
        return Hash::make($datos);
    }
}

