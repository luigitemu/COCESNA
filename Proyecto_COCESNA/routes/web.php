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

Route::get('/actualizarPregunta','AreaController@actualizarPregunta')->name('administrador.actualizarPregunta');

Route::get('/agregarArea','AreaController@agregarArea')->name('administrador.agregarArea');  //agrega un area

Route::get('/agregarPregunta','AreaController@agregarPreguntaAJAX')->name('administrador.agregarPregunta'); //agrega una pregunta a un area

Route::get('/areas','AreaController@mostrarAreas')->name('encuesta.mostrarAreas');    //dirige a la pagina de areas de preguntas

Route::get('/elementosDelTipo','AreaController@mostrarRespuestasDelTipo')->name('tipoRespuesta.elementos');

Route::get('/fin','MainController@finalizar')->name('encuesta.fin');    //dirige hacia el final de la encuesta

Route::get('/grdRes','MainController@guardarRespuestas')->name('encuesta.guardar');

Route::get('/PreguntasAJAX','AreaController@verPreguntasAJAX')->name('area.preguntasAJAX');

Route::get('/pagPriAdm','MainController@ingresarComoAdmin')->name('administrador.principal');

Route::get('/pagPriAdm/{id}','AreaController@borrarArea')->name('administrador.destroy');

Route::get('/preguntas', 'AreaController@paginaPreguntas')->name('pagina.preguntas');

Route::get('/preguntas/{id}', 'AreaController@borrarPregunta')->name('administrador.borrarPreguntas');

//Route::get('/preguntasControlador', 'AreaController@borrarPregunta')->name('administrador.borrarPreguntas');

Route::put('/si-no','MainController@seleccionarEstado')->name('encuesta.seleccionar');   //dirige de acuerdo a la respuesta

Route::get('/tiposRespuesta','AreaController@obtenerTiposRespuesta')->name('encuesta.tiposDeRespuesta');

Route::get('/usuarios','UserController@mostrarUsuarios')->name('usuarios.mostrar');

Route::get('/usuarios/{id}','UserController@destroyUser')->name('usuarios.eliminar');

Route::get('/verReportes','ReportesController@mostrar')->name('reportes.mostrar');

Route::put('/verif','MainController@verificar')->name('sistema.verificarEmpleadoContrasena');    //verificar numero de empleado y contraseña
