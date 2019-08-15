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

Route::get('/', function () {
    return view('index');
});

Route::get('/laravel', function () {
    return view('welcome');
})->name('laravel');

Route::put("/la","UserController@verificar");

Route::get('/pregunta_filtro','UserController@preguntar')->name('pregunta');

Route::get('/fin','UserController@finalizar')->name('fin');