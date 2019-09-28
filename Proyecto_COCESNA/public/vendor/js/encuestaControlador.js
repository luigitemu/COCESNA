/**
 * Evita ataques CSRF
 */
$.ajaxSetup({
  headers: {
    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
  }
});



var idAreapreguntas;    
var idArea;             // guarda un id de un area de preguntas
var indicePreg = 0;     // cuenta el indice en el que va la pregunta
var soluc = {};         // Arreglo que contiene las elecciones del controlador
var quiz = $('#quiz');  // div del Quiz



$(document).ready(function(){
  let parametros = `id=${variables.id}`;
  $.ajax({
    url: variables.rutaMostrarPreguntas,
    method: 'GET',
    data: parametros,
    success: ( respuesta )=>{
      preguntas = respuesta.preguntas;
      idArea = respuesta.id;
      mostrarSig();  // Mostrar pregunta inicial
    }
  });
});



// Manejo del boton "Next"
$('#next').on('click', function (e) {
  e.preventDefault();
      
  // Suspende el boton de next durante la animacion
  if(quiz.is(':animated')) {        
    return false;
  } 
  var quizvacio = true;
  var cantresp = document.querySelectorAll("input[name=answer]");
  for(i = 0; i<cantresp.length; i++){
    if(cantresp[i].checked == true){
      quizvacio = false;
      break;
    }
  }
  
  if (quizvacio) {      // Si no selecciona una respuesta, el progreso se detiene
    alert('Favor seleccione una respuesta!');
  } else {
    eleccion();         //agrega las respuestas a un arreglo
    indicePreg++;
    mostrarSig();
  }
});



// Boton de finalizar
$('#start').click(function () {
  $('#start').html(
  `<div class="spinner-border my-2" role="status">
    <span class="sr-only">Loading...</span>
  </div>`);
  $.ajax({
    url: variables.rutaFinalizarEncuesta,
    method: 'GET',
    success: ( respuesta )=>{
      idAreapreguntas = '';
      idArea = '';
      indicePreg = 0;   // cuenta el indice en el que va la pregunta
      soluc = {};
      $('#titulo-enc').html('Fin de encuesta');
      $('#cuestmsj').html('Ha finalizado la encuesta <br> <p>Gracias por su participación.</p>');
      $('#enc-sig').css('display','none');
      $('#start').html('Finalizar encuesta');
      $('#start').css('display','none');
      setTimeout(function(){
        window.location = variables.redireccionLogin
      }, 2000);         // dentro de 2 segundos redirecciona 
    }
  });
});



// Animates buttons on hover
$('.button').on('mouseenter', function () {
  $(this).addClass('active');
});
$('.button').on('mouseleave', function () {
  $(this).removeClass('active');
});



//crea y devuelve el div que contiene la pregunta y sus respectivas respuestas
function crearElemenPreg(index) {
  var itempreg = $('<div>', {
    id: 'cuest'
  });
  var cuest = $('<p class="preg-size">').append(preguntas[index].cuest);
  itempreg.append(cuest);
  
  var radioButtons = aggResp(index);
  itempreg.append(radioButtons);
  
  return itempreg;
}



// Crea una lista de respuestas con radiobotones
function aggResp(index) {
  var lista = $('<ul class="list-group">');
  var item;
  var ent = '';
  for (var i = 0; i < preguntas[index].respuestas.length; i++) {
    item = $(`<li class="list-group-item" value="${i}" onclick="selecradio(this)">`);
    ent = `<label><input type="radio" name="answer" value="${i}" /><span class="ml-1">${preguntas[index].respuestas[i]}</span></label>`;
    item.append(ent);
    lista.append(item);
  }
  return lista;
}
 


// Obtiene la selecion del usuario y la guarda en un arreglo para ser almacenada en la base de datos
function eleccion() {
  soluc[preguntas[indicePreg].cuest] = preguntas[indicePreg].respuestas[$('input[name="answer"]:checked').val()];
  let parametros = `idArea=${idArea}&pregunta=${encodeURIComponent(preguntas[indicePreg].cuest)}&respuesta=${preguntas[indicePreg].respuestas[$('input[name="answer"]:checked').val()]}`;
  $.ajax({
    url: variables.rutaGuardarRespuestas,
    method: 'GET',
    data: parametros,
    dataType: 'json',
  });
}
    


// Muestra la siguiente pregunta
function mostrarSig() {
  if(preguntas.length == 0){
    window.location = "/";
  }
  quiz.fadeOut(function() {
    $('#cuest').remove();
    if(indicePreg < preguntas.length) {
      var sigPreg = crearElemenPreg(indicePreg);
      quiz.append(sigPreg).fadeIn();  
      if(indicePreg === 0) {
        $('#next').show();
      }
    }else {
      var scoreElem = mensajefin();
      quiz.append(scoreElem).fadeIn();
      $('#next').hide();
      $('#start').show();
      $('#enc-sig').show();
    }
  });
}



function mensajefin() {
  var score = $('<p>',{id: 'cuestmsj'});
  score.append(`Respuestas guardadas.</p>`);
  return score;
}



function selecradio(ob){
  item= ob.value;
  x = document.querySelectorAll("input[name=answer]");
  x[item].checked=true;
}



$('#contras').on('click', function(){
  $('#mail-modal').modal('show');
});



var reemplazar = 3;
// $('#mail-send').on('click',function(){
//   console.log('se ha enviado su correo');
//   $('#mail-cont').replaceWith(`<div class="modal-body" id="load-cont">
//                               Su correo fue enviado con exito <span class="check-ico"><i class="fas fa-check"></i></span>
//                               </div>
//                               <div class="modal-body" id="load-cont">
//                               Error. Intentelo de nuevo <span class="fail-ico"><i class="fas fa-times"></i></span>
//                               </div>`);
//   $('#mail-cancel').html("cerrar");
// });



function confirmarEnviar(noEmp) {
  let parametros = `noEmpleado=${noEmp}`;
  $.ajax({
    url: variables.contrasenaCorreo,
    method: 'GET',
    data: parametros,
    dataType: 'json',
    success: ( respuesta )=>{
      console.log(respuesta);
      $('mail-cont').html('Su correo fue enviado con exito');
    }
  });
}



