@extends('plantillas.encuesta')
@section('cuerpoPagina')
	<div id='container'>
		<button type="button" id="contras" class="btn btn-outline-secondary" data-toggle="tooltip" data-placement="bottom" title="Cambiar contraseña"><i class="fas fa-wrench"></i></button>
		<div id="envolver">
			<div id='title' class="mt-4">
				<h1 class="titulo-enc" id="titulo-enc">Encuesta: {{$nombreArea}}</h1>
			</div>
			<br/>
			<div id='quiz'></div>
			<div class='button quiz-btn' id='next'><span>siguiente</span></div>
			<div class='button quiz-btn' id='start'><span>Finalizar encuesta</span></div>
			<div class='button quiz-btn quiz-btn-red' id='enc-sig'><span onclick="Regresar();">Realizar otra encuesta</span></div>
		</div>
	</div>		
	<div class="modal fade" id="mail-modal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Cambio de clave</h5>
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
					<button type="button" class="btn btn-secondary" data-dismiss="modal" id="mail-cancel">Cancelar</button>
					<button type="button" class="btn btn-primary" id="mail-send" onclick="confirmarEnviar('{{ Session::get('noEmpleado') }}');">Enviar</button>
				</div>
			</div>
		</div>
	</div>
@endsection

@section('scripts')
	<script>
		var variables = {
			id: "{{ $id }}",
			rutaMostrarPreguntas: "{{ route('area.preguntasAJAX') }}",
			rutaGuardarRespuestas: "{{ route('encuesta.guardar') }}",
			rutaFinalizarEncuesta: "{{ route('encuesta.fin') }}",
			redireccionLogin: "{{ route('sistema.inicio') }}",
			contrasenaCorreo: "{{ route('usuario.recuperar') }}",
		}
		function Regresar(){
			window.location = "{{ route('encuesta.mostrarAreas') }}"
		}
	</script> 		
@endsection
