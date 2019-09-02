@extends('plantillas.plantilla1')

@section('tituloPagina','COCESNA')

@section('head')
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="shortcut icon" href="../img/icon.png" type="image/x-icon">
  <link href="{{ asset('css/simple-sidebar.css') }}" rel="stylesheet"><!-- Custom styles for this template -->
  <link rel="stylesheet" href="{{ asset('css/crear-areas.css') }}">
  <link rel="stylesheet" href="{{ asset('css/preguntas-css.css') }}">
@endsection

@section('cuerpoPagina')
<div class="d-flex" id="wrapper">
  <div class="bg-light border-right" id="sidebar-wrapper">
    <div class="sidebar-heading">
      <i class="fas fa-users-cog mr-1"></i>Administrador
    </div>
    <div class="list-group list-group-flush">
      <a href="#" class="list-group-item list-group-item-action bg-light">Area de Preguntas</a>
    </div>
  </div>
  <div id="page-content-wrapper">
    <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom" id="navbar">
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <!-- <button class="btn btn-primary" id="menu-toggle">Ocultar</button> -->
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Salir</a>
          </li>
          <!-- <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Salir
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="#">Salir</a>
              <a class="dropdown-item" href="#">Another action</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">Something else here</a>
            </div>
          </li> -->
        </ul>
      </div>
    </nav>

    <div class="container-fluid">
      <!-- <h1 class="mt-4">Areas de Preguntas</h1> -->
      <div class="d-sm-flex align-items-center justify-content-between mb-4 mt-3">
        <h1 class="h3 mb-0 text-gray-800">Preguntas del área {{ $nombreArea }}</h1>
        <a role="button" class="d-none d-sm-inline-block btn btn-sm btn-area-preg shadow-sm" data-toggle="modal" data-target="#modalAgregarPregunta"><i class="far fa-file-alt mr-1"></i>Agregar Preguntas</a>
      </div>
      <hr>
      <div class="row" id="card-preguntas">
        <!--
        <div class="card">
          <div class="row">
            <div class="col-12">
              <div class="row mb-4">
                <h3 class="mr-2" id="pregunta-1">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Mollitia, eaque?</h3>
                <button type="button" class="btn btn-edit" onclick="editarPregunta();" ><i class="fas fa-edit"></i></button>
              </div>
              <ul class="list-group list-group-flush" id="respuestasPregunta1">
                <li class="list-group-item">
                  <div class="row">
                    <div class="col-8">
                      <span class="space">Si</span>
                    </div>
                  </div>
                </li>
                <li class="list-group-item">
                  <div class="row">
                    <div class="col-8">
                      <span class="space">No</span>
                    </div>
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </div>
      --> 
      </div>
    </div>
  </div>
  <!-- /#page-content-wrapper -->

</div>
<!-- /#wrapper -->
<!-- modal -->
<!-- Button trigger modal -->

<!--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalAgregarPregunta">Launch demo modal</button>-->
<!-- Modal -->
<div class="modal fade" id="modalAgregarPregunta" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
<div class="modal-dialog" role="document">
  <div class="modal-content">
    <div class="modal-header">
      <h5 class="modal-title" id="exampleModalLabel">Agregar Preguntas</h5>
      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button>
    </div>
    <div class="modal-body">
      <form>
        <div class="form-group">
          <label for="pregunta" class="col-form-label">Pregunta:</label>
          <input type="text" class="form-control" id="pregunta">
          <div id="valida-pregunta"></div>
        </div>
        <div class="row">
          <h5 class="ml-4 mb-4 mr-4 col-form-label">Tipo de respuesta:</h5>
          <select id="inputState" class="form-tipo col-5">
            <!--
            <option>Cerrada</option>
            <option>Escala numérica</option>
            <option>Escala ordinal</option>
            -->
          </select>
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
<!-- modal de Editar Pregunta --> 
<div class="modal fade" id="modalAgregarPregunta" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
<div class="modal-dialog" role="document">
  <div class="modal-content">
    <div class="modal-header">
      <h5 class="modal-title" id="exampleModalLabel">Modificar Pregunta</h5>
      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button>
    </div>
    <div class="modal-body">
      
        <div class="form-group">
          <label for="recipient-name" class="col-form-label">Pregunta:</label>
          <input type="text" class="form-control" id="nombre">
          <div id="valida-nombre"></div>
        </div>
      
    </div>
    <div class="modal-footer">
      <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      <button type="button" class="btn btn-primary" onclick="validar();" onkeypress="validar();">Guardar Cambios</button>
    </div>
  </div>
</div>
</div>
@endsection

@section('scripts')
<script>
  var AJAX = {
    idArea:"{{ $id }}",
    rutaMostrarTiposRespuestas: "{{ route('encuesta.tiposDeRespuesta') }}",
    rutaMostrarRespuestasDelTipo: "{{ route('tipoRespuesta.elementos') }}",
    rutaMostrarPreguntas: "{{ route('area.preguntasAJAX') }}",
    rutaAgregarPreguntas: "{{ route('administrador.agregarPregunta') }}"
  }
</script>
<script src="{{ asset('vendor/js/mainPreguntas.js') }}"></script>

@endsection