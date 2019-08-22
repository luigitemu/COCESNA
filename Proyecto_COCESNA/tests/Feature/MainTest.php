<?php

namespace Tests\Feature;

use App\Personal;
use App\Usuarios;
use App\Posicion;
use App\RegEntrada;
use App\Turno;
use Tests\TestCase;
use Illuminate\Support\Facades\DB; //Importar DB
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;

class MainTest extends TestCase
{


    /**
     * A basic feature test example.
     *
     * @return void
     */


    //Esta funcion se encarga de borrar los registros de las tablas
    protected function truncateTables(array $tables){
        DB::statement('SET FOREIGN_KEY_CHECKS = 0');
        foreach ($tables as $table) {
            DB::table($table)->truncate();
        }
        DB::statement('SET FOREIGN_KEY_CHECKS = 1');
    }


    /**
     @test*/
    public function el_usuario_usa_la_ruta_de_iniciar_sesion()
    {
        $this->get('/')
        ->assertStatus(200)
        ->assertSee('Número de empleado')
        ->assertSee('Contraseña');
    }


    /**
     @test*/
    public function el_usuario_ingresa_texto_en_la_entrada_de_numeroEmpleado()
    {

        //$this->withoutExceptionHandling();
        factory(Personal::class)->create([
            'no_empleado'=>'3'
        ]);
        $this->from('/')
            ->put('/verif',[
                'numeroEmpleado' => 'n',
            ])
            ->assertRedirect("/")
            ->assertSessionHasErrors([
                'numeroEmpleado' => 'El número de empleado es invalido',
                ]);
        $this->truncateTables([
            'personal',
        ]);
    }


    /**
     @test*/
    public function el_usuario_no_ingresa_numero_de_empleado_en_la_entrada_de_numeroEmpleado()
    {
        factory(Personal::class)->create([
            'no_empleado'=>'3'
        ]);
        $this->from('/')
            ->put('/verif',[
                'numeroEmpleado' => '',
            ])
            ->assertRedirect("/")
            ->assertSessionHasErrors([
                'numeroEmpleado' => 'El número de empleado es obligatorio',
                ]);
        $this->truncateTables([
            'personal',
        ]);
    }


    /**
     @test*/
    public function el_usuario_no_ingresa_su_contrasena()
    {
        $this->truncateTables([
            'personal',
            'posicion',
            'turnos',
            'usuarios',
        ]);
        factory(Personal::class)->create([
            'id_personal' => '1',
            'no_empleado'=> '3',
        ]);
        factory(Posicion::class)->create([
            'id_posicion' => '1'
        ]);
        factory(Turno::class)->create([
            'id_turno' => '1'
        ]);
        factory(Usuarios::class)->create([
            'id_personal' => '1',
            'id_posicion' => '1',
            'id_turno' => '1',
        ]);
        $this->from('/')
            ->put('/verif',[
                'numeroEmpleado' => '3',
                'contrasena' => '',
            ])
            ->assertRedirect("/")
            ->assertSessionHasErrors([
                'contrasena' => 'La contraseña es obligatoria',
                ]);
        $this->truncateTables([
            'personal',
            'posicion',
            'turnos',
            'usuarios',
        ]);
    }


    /**
     @test*/
     public function el_usuario_no_ingresa_una_contrasena_incorrecta()
     {
         $this->truncateTables([
             'personal',
             'posicion',
             'turnos',
             'usuarios',
         ]);
         factory(Personal::class)->create([
             'id_personal' => '1',
             'no_empleado'=> '3',
         ]);
         factory(Posicion::class)->create([
             'id_posicion' => '1'
         ]);
         factory(Turno::class)->create([
             'id_turno' => '1'
         ]);
         factory(Usuarios::class)->create([
             'id_personal' => '1',
             'id_posicion' => '1',
             'id_turno' => '1',
         ]);
         $this->from('/')
             ->put('/verif',[
                 'numeroEmpleado' => '3',
                 'contrasena' => '222a2s',
             ])
             ->assertRedirect("/")
             ->assertSessionHasErrors([
                 'contrasena' => 'La contraseña es incorrecta',
                 ]);
         $this->truncateTables([
             'personal',
             'posicion',
             'turnos',
             'usuarios',
         ]);
     }


    /**
    @test*/
    public function el_usuario_ingresa_correctamente_su_informacion_y_almacena_la_hora_de_entrada()
    {
        $this->truncateTables([
            'personal',
            'posicion',
            'turnos',
            'usuarios',
            'user',
        ]);
        factory(Personal::class)->create([
            'id_personal' => '1',
            'no_empleado'=> '3',
        ]);
        factory(Posicion::class)->create([
            'id_posicion' => '1'
        ]);
        factory(Turno::class)->create([
            'id_turno' => '1'
        ]);
        factory(Usuarios::class)->create([
            'id_personal' => '1',
            'id_posicion' => '1',
            'id_turno' => '1',
        ]);
        $this->from('/')
            ->put('/verif',[
                'numeroEmpleado' => '3',
                'contrasena' => '0000',
            ])
            ->assertRedirect("/pagPriAdm");

        $this->assertSame(1,RegEntrada::count());

        $this->truncateTables([
            'personal',
            'posicion',
            'turnos',
            'usuarios',
            'user',
        ]);
    }

}
