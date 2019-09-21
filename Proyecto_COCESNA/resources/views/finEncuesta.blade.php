@extends('plantillas.encuesta')

@section('cuerpoPagina')
  <div id='container'>
    <div id="envolver">
      <div id="title" class="mt-4">
        <h1 class="titulo-enc" id="titulo-enc">Fin de encuesta</h1>
      </div>
      <br>        
      <div id="quiz" style="display: block;"><p id="cuestmsj">Ha finalizado la encuesta <br>Gracias por su participación.</p></div>
    </div>
  </div>
@endsection

@section('scripts')
  {{-- 
    el siguiente script permite que 
    la pagina se redireccione a la vista 
    "iniciarSesion" luego de terminar 
    la encuesta 
  --}}
  <script> 
    var home = '{{ route("sistema.inicio") }}';
    setTimeout(function(){
      window.location = home;
    }, 4000); //dentro de 4 segundos redirecciona 
    var variables = {};
  </script>
@endsection
