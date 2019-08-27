function editarPregunta() {

}

var campo = {
    id: 'pregunta',
    valido: false
}

function validar() {
    ($('#'+campo.id).val() === '')?campo.valido = false: campo.valido=true;
    marcar(campo);

    if(campo.valido== false)
    return;

    mostrar();

}


function marcar(valor) {
    
    // (valor.valido == false)?console.log('no es valido'):console.log(' es valido');
    
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
function mostrar () {
    $('#card-preguntas').append(`
     
    <div class="card">
    <div class="row">
    <div class="col-12">
    <div class="row">
    <h3 class="mr-2" id="pregunta-1">${$('#pregunta').val()}</h3>
    <button type="button" class="btn btn-edit" onclick="editarPregunta();" ><i class="fas fa-edit"></i></button>
    </div>
    <div class="row">
    <h5 class="ml-4 mb-4 mr-2 title-tipo">Tipo:</h5>
    <select id="inputState" class="form-tipo col-4">
    <option selected>Seleccion Unica</option>
    <option>Seleccion Multiple</option>
    </select>
    </div>
    <ul class="list-group list-group-flush">
    <li class="list-group-item">
    <div class="row">
    <div class="col-8">
    <span class="space">Respuesta 1</span>
    </div>
    <div class="col-4 d-flex justify-content-end">
    <div class="btn-group" role="group" style="width: 72px">
    <button type="button" class="btn edi-elim btn-eliminar-res btn-sm mr-1"><i class="fas fa-trash-alt"></i></button>
    <button type="button" class="btn edi-elim btn-edit-res btn-sm"><i class="fas fa-pen"></i></button>
    </div>
    </div>
    </div>
    </li>         
    </ul>
    </div>
    <div class="col-12 d-flex justify-content-center align-items-center">
    <ul class="list-group list-group-horizontal lista-preg">
    <!-- <li class="list-group-item b-w"><a href="" class="fc-r"><i class="far fa-window-close mr-1"></i>Cancelar</a></li> -->
    <li class="list-group-item b-w"><a href="" class="fc-b"><i class="far fa-plus-square mr-1"></i>Agregar respuesta</a></li>
    <!-- <li class="list-group-item b-w"><a href="" class="fc-g"><i class="far fa-save mr-1"></i>Guardar</a></li> -->
    </ul>
    </div>
    </div>
    </div> 

    
    `);
}
function editar () {
  let elemento = document.querySelector('#titulo');
     elemento.toggleAttribute('disabled');
}



