@extends('plantillas.dashboard')

@section('tituloDashboard')
  <div class="d-sm-flex align-items-center justify-content-between mb-4 mt-3">
    <h1 class="h3 mb-0 text-gray-800">Areas De Preguntas</h1>
    <a role="button" class="d-none d-sm-inline-block btn btn-sm btn-area-preg shadow-sm" data-toggle="modal" data-target="#modalAgregarPregunta"><i class="far fa-file-alt mr-1"></i>Crear Area de Preguntas</a>
  </div>
  <hr>
@endsection

@section('contenido')

  @foreach ($areas as $area)

    <div class="col-12 col-lg-6 col-xl-4"  style="z-index:1;">
      <div class="card card-style mb-3">
        <div  id="{{ $area->id_area }}"  onclick="mostrarPreguntas(this)">
          <div class="card-header"><span class="mr-1 titulo-enc">
            Encuesta:</span>{{ $area->nombre }}
          </div>
          <div class="card-body" >
            <h5 class="card-title descripcion-enc">Descripcion</h5>
            <p class="card-text">{{ $area->descripcion }}</p>
          </div>
        </div>
        <div class="card-footer d-flex justify-content-center">
          <button type="button" class="btn btn-success mb-2 mr-3"  onclick="" data-toggle="modal" > Editar </button>
          <button type="button" class="btn btn-danger mb-2 mr-3"  onclick="eliminar({{ $area->id_area }})" data-toggle="modal" > Eliminar </button>
        </div>
      </div>
    </div>

  @endforeach

@endsection

@section('modalEliminar')
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

@section('modalPrincipal')
  <div class="modal fade" id="modalAgregarPregunta" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Crear Area de Preguntas</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form>
            <div class="form-group">
              <label for="recipient-name" class="col-form-label">Nombre:</label>
              <input type="text" class="form-control" id="nombre">
              <div id="valida-nombre"></div>
            </div>
            <div class="form-group">
              <label for="message-text" class="col-form-label">Descripcion :</label>
              <textarea class="form-control" id="descripcion"></textarea>
              <div id="valida-descripcion"></div>
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
          <button type="button" class="btn btn-primary" onclick="validar();">Guardar Cambios</button>
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