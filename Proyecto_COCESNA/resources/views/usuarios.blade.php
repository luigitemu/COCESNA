@extends('plantillas.dashboard')

@section('tituloDashboard')
  <div class="d-sm-flex align-items-center justify-content-between mb-4 mt-3">
    <h1 class="h3 mb-0 text-gray-800">Usuarios</h1>
    <a role="button" class="d-none d-sm-inline-block btn btn-sm btn-area-preg shadow-sm" data-toggle="modal" data-target="#modalAgregarUsuario"><i class="far fa-file-alt mr-1"></i>Agregar Usuario</a>
  </div>
  <hr>
@endsection

@section('contenido')
  <table class="table mx-2">
    <thead class="thead-dark">
      <tr>
        <th scope="col">No. empleado</th>
        <th scope="col">Nombre completo</th>
        <th scope="col">Posicion</th>
        <th scope="col">Correo</th>
        <th scope="col">Accion</th>
      </tr>
    </thead>
    <tbody id="tbl-usuarios">
      
      @forelse ($usuarios as $usuario)
        <tr>
          <th scope="row">{{ $usuario->no_empleado }}</th>
          <td>{{ $usuario->nombres }} {{ $usuario->apellidos }}</td>
          <td>{{ $usuario->posicion }}</td>
          <td>{{ $usuario->email }}</td>
          <td>
            <button class="btn btn-success" onclick="editarUsuario({{ $usuario->no_empleado }},'{{ $usuario->email }}','{{ $usuario->posicion }}');"> <i class="far fa-edit"></i></button>
            <button class="btn btn-danger" onclick="eliminarUsuario({{ $usuario->no_empleado }})"><i class="fas fa-user-minus"></i></button>
          </td>
        </tr>
        @empty
        <tr>
          <td colspan="5">
            <h1> No hay Usuarios registrados</h1>
          </td>
        </tr>
      @endforelse

    </tbody>
  </table>

@endsection

@section('modalPrincipal')
  <div class="modal fade" id="modalAgregarUsuario" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Agregar Usuario</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Seleccione el número de empleado:</label>
            <select type="text" class="form-control" id="noEmpleado-agregar" default="asd">
              @foreach ($id_disponibles as $empleado)
                <option value="{{ $empleado->no_empleado }}">{{ $empleado->no_empleado }}</option>
              @endforeach
            </select>
            <div id="valida-nombre"></div>
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">Correo:</label>
            <input type="text" id="correo-agregar" class="form-control">
            <div id="valida-correo-agregar"></div>
          </div>
          <div class="form-group">
            <label for="posicion-agregar" class="col-form-label">posicion:</label>
            <select name="posicion" class="form-control" id="posicion-agregar">
              @foreach ($posiciones as $posicion)
                <option value="{{ $posicion->id_posicion }}">{{ $posicion->posicion }}</option>
              @endforeach
            </select>
            <div id="valida-posicion-agregar"></div>
          </div>
          <div class="form-group">
            <label for="turno-agregar" class="col-form-label">Turno:</label>
            <select name="turno" class="form-control" id="turno-agregar">
              @foreach ($turnos as $turno)
                <option value="{{ $turno->id_turno }}">{{ $turno->turno }}</option>
              @endforeach
            </select>
            <div id="valida-turno-agregar"></div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
          <button type="button" class="btn btn-primary" onclick="validar(1);">Guardar Cambios</button>
        </div>
      </div>
    </div>
  </div>

  <div class="modal fade" id="modalEditarUsuario" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Editar Usuario</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="form-group">
            <label for="message-text" class="col-form-label">Correo:</label>
            <input type="text" id="input-correo-editar" class="form-control">
            <div id="valida-input-correo-editar"></div>
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">posicion:</label>
            <select name="posicion" class="form-control" id="select-posicion">
              @foreach ($posiciones as $posicion)
                <option value="{{ $posicion->posicion }}">{{ $posicion->posicion }}</option>
              @endforeach
            </select>
            <div id="valida-posicion"></div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
          <button type="button" class="btn btn-primary" onclick="validar();">Actualizar</button>
        </div>
      </div>
    </div>
  </div>
@endsection

@section('modalEliminar')
<div class="modal fade" id="modalEliminar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Eliminar Usuario</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="contenidoModal">

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" onclick="confirmarEliminar()" class="btn btn-danger">Eliminar</button>
      </div>
    </div>
  </div>
</div>
@endsection

@section('scripts')
  <script>
    var ruta = "{{ route('usuarios.mostrar') }}";
    var actualizar = "{{ route('usuarios.actualizar') }}";
    var agregarUsuario = "{{ route('usuario.agregar') }}";
  </script>
  <script src="{{ asset('vendor/js/mainUsuarios.js') }}"></script>
@endsection
