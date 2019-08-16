@extends('plantillas.plantilla1')

@section('tituloPagina','Pregunta filtro')

@section('cuerpoPagina')
  <div style="height:100px;"></div>
  <div class="container">
    <div class="row">
      <div class="col-8 mx-auto border px-5 py-5">
        <h2 class="mb-5">¿Estoy en forma para realizar el turno?</h2>
        <div class="d-flex justify-content-end ">
          <a href="{{ route('encuesta.fin') }}" class="btn btn-success mr-3">Si</a>
          <a href="{{ route('encuesta.fin') }}" class="btn btn-danger">No</a>
        </div>
      </div>
    </div>
  </div>
@endsection