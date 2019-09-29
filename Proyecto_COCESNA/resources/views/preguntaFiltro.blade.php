@extends('plantillas.plantilla1')

@section('tituloPagina','Pregunta filtro')

@section('head')
  <link rel="stylesheet" href="{{ asset('css/r34.css') }}">
@endsection

@section('cuerpoPagina')
  <div style="height:100px;"></div>
  {{-- <button data-toggle="modal" data-target="#modalCambioContrasena">Cambiar contraseña</button> --}}
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
      </div>
    </div>
  </div>
  <div style="height:100px;"></div>
{{-- 
  <div class="modal fade" id="modalCambioContrasena" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Cambio de Contraseña</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
          </button>
        </div>
      <div class="modal-body">
        <div class="form-group">
          <label for="nuevaContrasena1" class="col-form-label">Ingrese una nueva contraseña:</label>
          <input type="password" class="form-control" id="nuevaContrasena1">
          <div id="valida-nuevaContrasena1"></div>
          <label for="nuevaContrasena2" class="col-form-label">Confirme la nueva contraseña:</label>
          <input type="password" class="form-control" id="nuevaContrasena2">
          <div id="valida-nuevaContrasena2"></div>
        </div>
      </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
          <button type="button" class="btn btn-danger" onclick="cambiarContrasena('{{ route('usuario.cambiarContrasena') }}','{{ Session::get('noEmpleado') }}');">Guardar cambios</button>
        </div>
      </div>
    </div>
  </div> --}}
@endsection

{{-- 
@section('scripts')
  <script>
    $.ajaxSetup({
      headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
      }
    });
    
    function cambiarContrasena(ruta,noEmp){
      if ($('#nuevaContrasena1').val() == $('#nuevaContrasena2').val()) {
        let parametros = `noEmp=${ noEmp }&contrasena=${ $('#nuevaContrasena1').val() }`;
        console.log(ruta);
        console.log(parametros);
        $.ajax({
          url: ruta,
          method: 'GET',
          data: parametros,
          success: ( respuesta )=>{
            console.log(respuesta);
            alert('Contraseña cambiada exitosamente');
            $('#modalCambioContrasena').modal('hide');
          }
        });
      } else {
        console.log('contrasenas incorrectas');
      }
    }
  </script>
@endsection --}}