
var idAreapreguntas;
var idArea;

$(document).ready(function(){
    let parametros = `id=${variables.id}`;
    //console.log(parametros);
    $.ajax({
        url: variables.rutaMostrarPreguntas,
        method: 'GET',
        data: parametros,
        success: ( respuesta )=>{
            //console.log(respuesta);
            preguntas = respuesta.preguntas;
            idArea = respuesta.id;
            //console.log(idArea);
            //console.log(preguntas);
            mostrarSig();  // Mostrar pregunta inicial
        }
    });
});
    // var preguntas = [{
    //   cuest: "Como te sientes hoy",
    //   respuestas: ["muy bien","bien","regular","mal", "muy mal"]
    // }, {
    //   cuest: "Sientes dolor de cabeza",
    //   respuestas: ["si","no"]
    // }, {
    //   cuest: "Llevas mucho tiempo en mal estado",
    //   respuestas: ["si","no"]
    // }, {
    //   cuest: "Que tan fatigado te sientes hoy",
    //   respuestas: ["mucho","medio","poco","muy poco"]
    // }];
    
    var indicePreg = 0; //cuenta el indice en el que va la pregunta
    var soluc = {}; //Arreglo que contiene las elecciones del controlador
    var quiz = $('#quiz'); //div del Quiz
    
    // mostrarSig();  // Mostrar pregunta inicial
    
    // Manejo del boton "Next"
    $('#next').on('click', function (e) {
      e.preventDefault();
      
      // Suspende el boton de next durante la animacion
      if(quiz.is(':animated')) {        
        return false;
      }
      eleccion();//agrega las respuestas a un arreglo

      var quizvacio=true;
      var cantresp=document.querySelectorAll("input[name=answer]");
      for(i=0;i<cantresp.length;i++){
        if(cantresp[i].checked==true){
          quizvacio=false;
          break;
        }
      }

      if (quizvacio) { // Si no selecciona una respuesta, el progreso se detiene
        alert('Favor seleccione una respuesta!');
      } else {
        indicePreg++;
        mostrarSig();
      }
    });
    
//----------------------------------------------Manejador de boton "siguiente"
    // $('#prev').on('click', function (e) {
    //   e.preventDefault();
      
    //   if(quiz.is(':animated')) {
    //     return false;
    //   }
    //   eleccion();
    //   indicePreg--;
    //   mostrarSig();
    // });
    
    //---------------------------------------"Empezar de nuevo"
    $('#start').on('click', function (e) {
      e.preventDefault();
      $("#cuestmsj").remove();
      if(quiz.is(':animated')) {
        return false;
      }
      indicePreg = 0;
      soluc = {};
      mostrarSig();
      $('#start').hide();
      $('#enc-sig').hide();
      //$('#enc-ter').hide();
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
      // preguntas[index].respuestas.forEach(element => {
      //   item = $(`<li class="list-group-item" value="${element}" onclick="selecradio(this)">`);
      //   ent = `<label><input type="radio" name="answer" value="${element}" /><span class="ml-1">${element}</span></label>`;
      //   item.append(ent);
      //   lista.append(item);
      // });
      return lista;
    }
    
    // Obtiene la selecion del usuario y la guarda en un arreglo
    function eleccion() {
      //soluc[indicePreg] = +$('input[name="answer"]:checked').val();
      soluc[preguntas[indicePreg].cuest] = preguntas[indicePreg].respuestas[$('input[name="answer"]:checked').val()];
      
      let parametros = `idArea=${idArea}&pregunta=${preguntas[indicePreg].cuest}&respuesta=${preguntas[indicePreg].respuestas[$('input[name="answer"]:checked').val()]}`;
      //var parametros = {};
      //parametros['idArea'] = idArea;
      //parametros['respuestas'] = soluc;
      //parametros = {'data': parametros};
      console.log(parametros);
      $.ajax({
        url: variables.rutaGuardarRespuestas,
        method: 'GET',
        data: parametros,
        success: ( respuesta )=>{
          console.log(respuesta);
        }
      });
    }
    
    // Muestra la siguiente pregunta
    function mostrarSig() {
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
          //$('#enc-ter').show();
        }
      });
    }
    
    function mensajefin() {
      var score = $('<p>',{id: 'cuestmsj'});
      //score.append(`Ha finalizado la encuesta! <br> <p>Gracias por su paciencia.</p>`);
      score.append(`Respuestas guardadas.</p>`)
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

var reemplazar =
$('#mail-send').on('click',function(){
  console.log('se ha enviado su correo');
  $('#mail-cont').replaceWith(`<div class="modal-body" id="load-cont">
                              Su correo fue enviado con exito <span class="check-ico"><i class="fas fa-check"></i></span>
                              </div>
                              <div class="modal-body" id="load-cont">
                              Error. Intentelo de nuevo <span class="fail-ico"><i class="fas fa-times"></i></span>
                              </div>`);
  $('#mail-cancel').html("cerrar");
});



