<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/','MainController@index')->name('pagina.inicio');     //pagina inicial

Route::get('/areas','MainController@mostrarAreas')->name('encuesta.mostrarAreas');    //dirige a la pagina de areas de preguntas

Route::get('/fin','MainController@finalizar')->name('encuesta.fin');    //dirige hacia el final de la encuesta

Route::get('/laravel','MainController@paginaLaravel')->name('pagina.Laravel');      //pagina de laravel

Route::get('/pagPriAdm','MainController@ingresarComoAdmin')->name('pagina.principalAdmin');

Route::get('/preguntaFiltro','MainController@preguntar')->name('encuesta.preguntaFiltro');  //dirige hacia la pregunta filtro

Route::put('/si-no','MainController@seleccionarEstado')->name('encuesta.seleccionar');   //dirige de acuerdo a la respuesta

Route::put('/verif','MainController@verificar')->name('verificar.empleadoContrasena');    //verificar numero de empleado y contraseña




