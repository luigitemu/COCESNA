@extends('plantillas.controlador')

@section('tituloDashboard')
  <div class="d-sm-flex align-items-center justify-content-between mb-4 mt-3">
    <h1 class="h3 mb-0 text-gray-800">Seleccione el área de preguntas que desea contestar</h1>
  </div>
  <hr>
@endsection

@section('nombreControlador')
  Controlador: {{ Session::get('nombreCompleto') }}
@endsection

@section('contenido')
  
  @foreach ($areas as $area)

    <div class="card-type front" id="{{ $area->id_area }}"  onclick="mostrarPreguntas(this)">
      <div class="blue"></div>
      <div class="yellow"></div>
      <div class="pink"></div>
      <div class="dots"></div>
      <div class="personal-intro">
        <p>{{ $area->nombre }}</p>
        <p>{{ $area->descripcion }}</p>
      </div>
    </div>
  
  @endforeach

@endsection

@section('scripts')
  <script>
    var rutas = {
      MostrarPreguntas: "{{ route('pagina.preguntas') }}",
      principalAdmin: "{{ route('administrador.principal') }}", 
    }
  </script>
@endsection