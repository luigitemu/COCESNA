@extends('plantillas.plantilla1')

@section('tituloPagina','Fin de la encuesta')

@section('head')
  <link rel="stylesheet" href="{{ asset('css/r34.css') }}">
@endsection

@section('cuerpoPagina')
  <div style="height:100px;"></div>
  <div class="container">
    <div class="row">
      <div class="col-8 mx-auto px-5 py-5 shadow-lg text-center">
        <div class="row mb-4">
          <div class="col-12 col-sm-12 col-md-8 my-auto">
            <h2 class="mb-4 my-auto">Gracias por su participación</h2>
          </div>
          <div class="col-12 col-sm-12 col-md-4 display-1" style="color:seagreen;">
            <i class="far fa-check-circle"></i>
          </div>
        </div>
        <div class="col-12 col-sm-12 col-md-8 my-auto">
          <span>
            Encuesta finalizada con éxito.
          </span>
        </div>
      </div>
    </div>
  </div>
  <div style="height:100px;"></div>
@endsection

@section('scripts')
  {{-- 
    el siguiente script permite que 
    la pagina se redireccione a la vista 
    "iniciarSesion" luego de terminar 
    la encuesta 
  --}}
  <script> 
    var home = '{{ asset('/preguntaFiltro') }}';
    
    //console.log(uri);
    setTimeout(function(){
      window.location = home
      }, 4000); //dentro de 4 segundos redirecciona 
  </script>
@endsection
