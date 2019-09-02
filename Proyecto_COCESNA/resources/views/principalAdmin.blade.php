@extends('plantillas.dashboard')

@section('tituloDashboard')
<div class="d-sm-flex align-items-center justify-content-between mb-4 mt-3">
    <h1 class="h3 mb-0 text-gray-800">Areas De Preguntas</h1>
    <a role="button" class="d-none d-sm-inline-block btn btn-sm btn-area-preg shadow-sm" data-toggle="modal" data-target="#modalAgregarPregunta"><i class="far fa-file-alt mr-1"></i>Crear Area de Preguntas</a>
  </div>
  <hr>

@endsection

@section('cartas')

@foreach ($areas   as $area)
<div class="col-lg-4"  style="z-index:1;">
        <div class="card card-style mb-3">
        <div  id="{{ $area->id_area }}"  onclick="mostrarPreguntas(this)">
        <div class="card-header"><span class="mr-1 titulo-enc">Encuesta:</span>{{ $area->nombre }}</div>
          <div class="card-body" >
            <h5 class="card-title descripcion-enc">Descripcion</h5>
            <p class="card-text">{{ $area->descripcion }}</p>
          </div>
        </div>
          <div class="card-footer">
                <button type="button" class="btn btn-danger form-control"  onclick="eliminar({{ $area->id_area }})" style="z-index:2" data-toggle="modal" > Eliminar </button>
          </div>
        </div>
     </div>
@endforeach

{{--  <div class="col-lg-4" id="area1" onclick="mifuncion(this)">
    <div class="card card-style mb-3">
        <form action="">
      <div class="card-header"><span class="mr-1 titulo-enc">Encuesta:</span>Fatiga</div>
      <div class="card-body">
        <h5 class="card-title descripcion-enc">Descripcion</h5>
        <p class="card-text">Conocer el estado de fatiga de los empleados</p>
      </div>
    </form>
    </div>
 </div>  --}}

@endsection

@section('modalEliminar')


<!-- Modal -->
<div class="modal fade" id="modalEliminar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="modal-eliminar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Eliminar</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div  id="contenido-modal" class="modal-body">

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button"  onclick="confirmarEliminar()"  class="btn btn-danger">Eliminar</button>
      </div>
    </div>
  </div>
</div>



@endsection

@section('scripts')
  <script>
    var rutas = {
      AgregarArea:"{{ route('administrador.agregarArea') }}",
      MostrarPreguntas: "{{ route('pagina.preguntas') }}",
      principalAdmin: "{{ route('administrador.principal') }}", 
    }
  </script>
@endsection