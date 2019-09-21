/**
 * Evita ataques CSRF
 */
$.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
});


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

var idEliminar;

function validar(){
    validarCampoVacio();
    console.log(campos);
    
    for(let i = 0;i<campos.length;i++)
        marcar(campos[i]);

    for(let i =0 ;i<campos.length;i++){
        if(campos[i].valido == false)
        return;
    }

    guardarMostrar();

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
function guardarMostrar() {
    let nombre = $('#'+campos[0].id).val();
    let descripcion = $('#'+campos[1].id).val();

    let parametros = `nombre=${nombre}&descripcion=${descripcion}`;
    $('#'+campos[0].id).val('');
    $('#'+campos[1].id).val('');
    $.ajax({
        // url: '/agregarArea',
        url: rutas.AgregarArea,
        method: 'GET',
        data: parametros,
        dataType: 'json',
        success: (res)=>{
            $('#areaPreguntas').html('');
            if(res.length == 0)
            {
                $('#areaPreguntas').html(`
                    <h4 class="ml-5">Sin áreas aún</h4>
                `);
            }else
            {
                res.forEach((e)=>{
                    mostrarAreas(e);
                });
            }
        }
    });
}

function mostrarAreas (elemento) {

    $('#areaPreguntas').append(`
    <div class="col-lg-4"  style="z-index:1;">
    <div class="card card-style mb-3">
    <div class="card-header"><span class="mr-1 titulo-enc">Encuesta:</span>${elemento.nombre}</div>
    <div class="card-body"  id="${elemento.id_area}" onclick="mostrarPreguntas(this)">
    <h5 class="card-title descripcion-enc">Descripción</h5>
    <p class="card-text">${elemento.descripcion}</p>
    </div>
    <div class="card-footer d-flex justify-content-center">
    <button type="button" class="btn btn-success mb-2 mr-3"  onclick="editar(${elemento.id_area},'${elemento.nombre}','${elemento.descripcion}');" data-toggle="modal" > Editar </button>
    <button type="button" class="btn btn-danger mb-2 mr-3"  onclick="eliminar(${elemento.id_area})" data-toggle="modal" > Eliminar </button>
    </div>
    </div>
    </div>
`);


}

function mostrarPreguntas(valor){
    //window.location.href = `/preguntas?id=${valor.id}`;
    window.location.href = `${rutas.MostrarPreguntas}?id=${valor.id}`;
}

function eliminar (id) {
    console.log('se eliminara este elemento '+ id);
    $('#modal-eliminar').modal('show');
    $('#contenido-modal').html(`¿Esta seguro que desea eliminar el Area?`);
    idEliminar = id;
}

function confirmarEliminar(){
    let id = idEliminar;
    console.log('entra aqui ' +id);
    $.ajax({
        url: `${rutas.principalAdmin}/${id}`,
        method: 'get',
        dataType: 'json',
        success: (res)=>{
            console.log(res);
            $('#areaPreguntas').html('');
            if(res.length == 0)
            {
                $('#areaPreguntas').html(`
                    <h4 class="ml-5">Sin áreas aún</h4>
                `);
            }else
            {
                res.forEach((e)=>{
                mostrarAreas(e);
                });
            }
        }
    });
    $('#modal-eliminar').modal('hide');
    return;
};

var idEditar;

function editar(id,nom,des){
    console.log('se editara este elemento '+ id);
    $('#modalEditarPregunta').modal('show');
    $('#nombre-editar').val(nom);
    $('#descripcion-editar').val(des);
    idEditar = id;
}

function confirmarEditar(){
    let parametros = `id=${idEditar}&nombre=${$('#nombre-editar').val()}&descripcion=${$('#descripcion-editar').val()}`;
    $.ajax({
        url: rutas.editarArea,
        method: 'get',
        data: parametros,
        dataType: 'json',
        success: (res)=>{
            console.log(res);
            $('#areaPreguntas').html('');
            if(res.length == 0)
            {
                $('#areaPreguntas').html(`
                    <h4 class="ml-5">Sin áreas aún</h4>
                `);
            }else
            {
                res.forEach((e)=>{
                mostrarAreas(e);
                });
            }
        }
    });
    $('#modal-eliminar').modal('hide');
    return;
};