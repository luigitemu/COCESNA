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

Route::get('/','MainController@index')->name('sistema.inicio');     //pagina inicial

Route::get('/agregarArea','MainController@agregarArea')->name('administrador.agregarArea');  //agrega un area

Route::get('/agregarPregunta','MainController@agregarPreguntaAJAX')->name('administrador.agregarPregunta'); //agrega una pregunta a un area

Route::get('/areas','MainController@mostrarAreas')->name('encuesta.mostrarAreas');    //dirige a la pagina de areas de preguntas

Route::get('/elementosDelTipo','MainController@mostrarRespuestasDelTipo')->name('tipoRespuesta.elementos');

Route::get('/fin','MainController@finalizar')->name('encuesta.fin');    //dirige hacia el final de la encuesta

Route::get('/PreguntasAJAX','MainController@verPreguntasAJAX')->name('area.preguntasAJAX');

Route::get('/pagPriAdm','MainController@ingresarComoAdmin')->name('administrador.principal');

Route::get('pagPriAdm/{id}','MainController@destroy')->name('administrador.destroy');

Route::get('/preguntas', 'MainController@paginaPreguntas')->name('pagina.preguntas');

//Route::get('/preguntasArea','MainController@verPreguntas') ->name('encuesta.preguntasArea');

Route::get('/preguntaFiltro','MainController@preguntar')->name('encuesta.preguntaFiltro');  //dirige hacia la pregunta filtro

//Route::get('/send/email', 'MainController@mail');   //ejemplo de enviar mensajes

Route::put('/si-no','MainController@seleccionarEstado')->name('encuesta.seleccionar');   //dirige de acuerdo a la respuesta

Route::get('/tiposRespuesta','MainController@obtenerTiposRespuesta')->name('encuesta.tiposDeRespuesta');

Route::get('/usuarios','MainController@mostrarUsuarios')->name('usuarios.mostrar');

Route::get('/verReportes','ReportesController@mostrar')->name('reportes.mostrar');

Route::put('/verif','MainController@verificar')->name('sistema.verificarEmpleadoContrasena');    //verificar numero de empleado y contraseña




