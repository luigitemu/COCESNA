/**
 * Evita ataques CSRF
 */
$.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
});




/**
 * Al iniciar la pagina, muestra las preguntas previamente creadas
 * y los tipos de respuestas permitidas
 */
$(document).ready(function(){ 
    mostrarPreguntasDelArea();
    let parametros = `area=${AJAX.idArea}`;
    $.ajax({
        url: AJAX.rutaMostrarTiposRespuestas,
        method: 'GET',
        data: parametros,
        success: ( respuesta )=>{
            //console.log(respuesta);
            mostrarTipos(respuesta);
        }
    });
});




var campo = {
    id: 'pregunta',
    valido: false
}




/**
 * valida la informacion del modal
 */
function validar() {
    ($('#'+campo.id).val() === '')?campo.valido = false: campo.valido=true;
    marcar(campo);

    if(campo.valido== false)
    return;

    //mostrar($('#'+campo.id).val());
    guardarPregunta();
    $('#card-preguntas').html('');
    mostrarPreguntasDelArea();

}



/**
 * resalta si la informacion es valida o invalida
 */
function marcar(valor) {
    
    if(valor.valido == false){
         $('#'+valor.id).addClass('is-invalid');
         $('#'+valor.id).removeClass('is-valid');
        $('#valida-'+valor.id).removeClass('valid-feedback');
        $('#valida-'+valor.id).addClass('invalid-feedback');
        $('#valida-'+valor.id).html('El campo no debe de ir vacio');

    
    }else{
       $('#'+valor.id).addClass('is-valid');
       $('#'+valor.id).removeClass('is-invalid');
        $('#valida-'+valor.id).removeClass('invalid-feedback');
        $('#valida-'+valor.id).addClass('valid-feedback');
        $('#valida-'+valor.id).html('Campo Correcto');
    }
    
}



/**
 * muestra una pregunta
 */
function mostrar (contenido,id,idTipo) {    
    $('#card-preguntas').append(`
      <div class="card">
        <div class="row">
          <div class="col-12">
            <div class="row mb-4">
              <h3 class="mr-2" id="pregunta${id}">${contenido}</h3>
              <button type="button" class="btn btn-edit" onclick="editarPregunta();" ><i class="fas fa-edit"></i></button>
            </div>
            <ul class="list-group list-group-flush" id="respuestasPregunta${id}">
            </ul>
          </div>
        </div>
      </div> 
    `);
    mostrarRespuestasDelTipo(id,idTipo);
}




/**
 * Muestra todas las preguntas del area seleccionada
 */
function mostrarPreguntasDelArea() {
    let parametros = `area=${AJAX.idArea}`;
    console.log(parametros);
    $.ajax({
        url: AJAX.rutaMostrarPreguntas,
        method: 'GET',
        data: parametros,
        success: ( respuesta )=>{
            console.log(respuesta);
            respuesta.forEach(element => {
                mostrar(element.contenido,element.id_pregunta,element.id_tipo);
            });
        }
    });
}




/**
 * muestra los tipos de respuestas en el modal
 */
function mostrarTipos(array) {
    array.forEach(element => {
        $('#inputState').append(
            `<option value="${element.id_tipo}">${element.tipo}</option>`
        );
    });
}




/**
 * muestra las respuestas que tiene una pregunta
 */
function mostrarRespuestasDelTipo(idPregunta,tipo) {
    let parametros = `id_tipo=${tipo}`;
    $.ajax({
        url: AJAX.rutaMostrarRespuestasDelTipo,
        method: 'GET',
        data: parametros,
        success: ( respuesta )=>{
            //console.log(respuesta);
            respuesta.forEach(element => {
                $('#respuestasPregunta'+idPregunta).append(`
                <li class="list-group-item">
                  <div class="row">
                    <div class="col-8">
                      <span class="space">${element.contenido}</span>
                    </div>
                  </div>
                </li>
                `);
            });
        }
    });
}




function editar () {
  let elemento = document.querySelector('#titulo');
     elemento.toggleAttribute('disabled');
}




/**
 * cuando la informacion ingresada en el modal es correcta, se almacena en la base de datos
 */
function guardarPregunta(){
    let parametros = `area=${AJAX.idArea}&tipo=${$('#inputState').val()}&contenido=${$('#'+campo.id).val()}`;
    //console.log(parametros);
    $.ajax({
        url: AJAX.rutaAgregarPreguntas,
        method: 'GET',
        data: parametros,
        success: ( respuesta )=>{
            console.log(respuesta);
        }
    });
}