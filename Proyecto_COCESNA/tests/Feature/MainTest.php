<?php

namespace Tests\Feature;

use Tests\TestCase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;

class MainTest extends TestCase
{
    use RefreshDatabase; //Recrea las migraciones en la otra BD antes de ejecutar las pruebas
    //una vez terminada cada prueba se revierten los cambios en cada prueba

    /**
     * A basic feature test example.
     *
     * @return void
     */

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
        $this->withoutExceptionHandling();
        $this->from('/')
            ->put('/verif',[
                'numeroEmpleado' => 'n+1',
            ])
            ->assertRedirect("/")
            ->assertSessionHasErrors([
                'numeroEmpleado' => 'El número de empleado es invalido',
                ]);
    }
}
