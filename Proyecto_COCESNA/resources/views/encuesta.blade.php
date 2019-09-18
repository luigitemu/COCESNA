<!-- FALTA INCLUIR LOS DOCUMENTOS DE BOOTSTRAP(QUE NO QUEDEN COMO LINKS) -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Encuesta</title>
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open Sans"/>
        <link href="{{ asset('vendor/bootstrap/css/bootstrap.min.css') }}" rel="stylesheet"><!-- Bootstrap core CSS -->
		<link rel="stylesheet" href="{{ asset('css/encuestaControlador.css') }}">
	</head>
	<body>
		<div id='container'>
			<button type="button" id="contras" class="btn btn-outline-secondary" data-toggle="tooltip" data-placement="bottom" title="Cambiar contraseña"><i class="fas fa-wrench"></i></button>
			<div id="envolver">
				<div id='title' class="mt-4">
					<h1 class="titulo-enc" id="titulo-enc">Encuesta: {{$nombreArea}}</h1>
				</div>
					 <br/>
					 {{--{{ $preguntas }}
					 <input type="hidden" id="hidden-preguntas" value="{{ $preguntas }}">--}}
				<div id='quiz'></div>
				<div class='button quiz-btn' id='next'><span>siguiente</span></div>
				<div class='button quiz-btn' id='start'><span>Comenzar de nuevo</span></div>
				<div class='button quiz-btn quiz-btn-red' id='enc-sig'><span onclick="Regresar();">Realizar otra encuesta</span></div>
		<!--		<div class='button quiz-btn quiz-btn-red' id='enc-ter'><span>Terminar</span></div>
    			 <button class='' id='next'>Siguiente</a></button>
    			<button class='' id='start'> Comenzar de nuevo</a></button> -->
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
					<div class="modal-body" id="mail-cont"> 
					  Presione "enviar" y automaticamente recibirá un correo con instrucciones para cambiar su contraseña.
					</div>
					<div class="modal-footer">
					  <button type="button" class="btn btn-secondary" data-dismiss="modal" id="mail-cancel">Cancelar</button>
					  <button type="button" class="btn btn-primary" id="mail-send">Enviar</button>
					</div>
				  </div>
				</div>
        </div>
    <script src="{{ asset('vendor/jquery/jquery.min.js') }}"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="{{ asset('vendor/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
		<script src="{{ asset('vendor/js/all.js') }}"></script>
		<script>
			var variables ={
				id: "{{ $id }}",
				rutaMostrarPreguntas: "{{ route('area.preguntasAJAX') }}",
				rutaGuardarRespuestas: "{{ route('encuesta.guardar') }}",
			}

			function Regresar(){
				window.location = "{{ route('encuesta.mostrarAreas') }}"
			}
    </script>        
		<script src="{{ asset('vendor/js/encuestaControlador.js') }}"></script>
	</body>
</html>
