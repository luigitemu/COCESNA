

// validaciones;
var campos = [
    {id: 'nombre', valido: false},
    {id: 'descripcion', valido: false}
];

function validarCampoVacio(){
        campos.forEach(valor=>{
            ($('#'+valor.id).val() === '')?valor.valido = false:valor.valido = true;
        });
}


function validar(){
    validarCampoVacio();
    console.log(campos);
    // campos.forEach(e => {
    //     marcar(e);
    // });

    for(let i = 0;i<campos.length;i++)
        marcar(campos[i]);
    
    for(let i =0 ;i<campos.length;i++){
        if(campos[i].valido == false)
        return;
    }

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
    let nombre = $('#'+campos[0].id).val();
    let descripcion = $('#'+campos[1].id).val();
    
    let parametros = `?nombre=${nombre}&descripcion=${descripcion}`;
    $.ajax({
        url: "/agregarArea",
        method: 'GET',
        data: parametros,
        success: ( respuesta )=>{
            console.log(respuesta);
            $('#areaPreguntas').append(`
                <div class="col-lg-4" id="area1" onclick="mifuncion(this)">
                <div class="card card-style mb-3" >
                <div class="card-header"><span class="mr-1 titulo-enc">Encuesta:</span>${nombre}</div>
                <div class="card-body">
                <h5 class="card-title descripcion-enc">Descripcion</h5>
                <p class="card-text">${descripcion}</p>
                </div>
                </div>
                </div>
            `);

        } 

    })


    
}


function mifuncion(valor){
    window.location.href = '/preguntasArea';
    
  }

