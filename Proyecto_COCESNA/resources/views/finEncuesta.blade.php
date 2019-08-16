@extends('plantillas.plantilla1')

@section('tituloPagina','Fin de la encuesta')

@section('cuerpoPagina')
  <div style="height:100px;"></div>
  <div class="container">
    <div class="row">
      <div class="col-8 mx-auto border px-5 py-5">
        <h2 class="mb-5">Gracias por su participación</h2>
        <span>Se enviarán los resultados de la encuesta a su correo electronico.</span>
        </div>
      </div>
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
    setTimeout(function(){window.location='/'}, 4000); //dentro de 4 segundos redirecciona 
  </script>
@endsection
