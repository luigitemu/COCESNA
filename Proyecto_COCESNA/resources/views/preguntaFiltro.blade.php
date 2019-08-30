@extends('plantillas.plantilla1')

@section('tituloPagina','Pregunta filtro')

@section('head')
  <link rel="stylesheet" href="{{ asset('css/r34.css') }}">
@endsection

@section('cuerpoPagina')
  <div style="height:100px;"></div>
  <div class="container">
    <div class="row">
      <div class="col-8 mx-auto px-5 py-5 shadow-lg">
        <h2 class="d-flex justify-content-center mb-5">{{ $preguntaFiltro }}</h2>
        <form method="POST" action="{{ route('encuesta.seleccionar') }}" id="box-repuestas-filtro" class="d-flex justify-content-center p-3">
          {{method_field('PUT')}}     {{-- cambia de method="POST" a method="PUT" --}}
          {!! csrf_field() !!}        <!--Proteccion de ataques csrf-->
          <input name="noEmpleado" type="hidden" value="{{ $datos }}">
          <button name="btn" type="submit" value="1" id="btn-filtro-si" class="btn btn-success mr-3">Si</button>
          <button name="btn" type="submit" value="0" id="btn-filtro-no" class="btn btn-danger">No</button>
        </form>
        
        {{-- Para pasar campos a una plantilla llamada por @include, primero
             definimos las secciones @section y por ultimo hacemos el llamado 
             @include a dicha plantilla --}}
        @section('masTexto')
            Este texto es agregado con la directiva section
        @endsection
        @include('plantillas.engranaje') {{-- Este es un llamado a una vista que contiene HTML que es incrustado en esta parte --}}

      </div>
    </div>
  </div>
  <div style="height:100px;"></div>
@endsection