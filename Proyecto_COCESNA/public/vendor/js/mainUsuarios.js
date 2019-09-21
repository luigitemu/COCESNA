var idEliminar;

function eliminarUsuario(id) {
$('#modalEliminar').modal('show');

idEliminar = id;
$('#contenidoModal').html(`Está seguro de eliminar el usuario con id = ${id}`);
}

function confirmarEliminar () {
    $.ajax({
        //url: `pagPriAdm/${id}`,
        url: `${ruta}/${idEliminar}`,
        method: 'get',
        dataType: 'json',
        success: res=>{
            console.log(res);
            $('#tbl-usuarios').html('');
            res.forEach((usuario)=>{
                $('#tbl-usuarios').append(`
                <tr>
                <th scope="row"> ${usuario.id_personal}</th>
                <td> ${usuario.nombres}</td>
                <td>${usuario.apellidos }</td>
                <td> ${usuario.turno}</td>
                <td> ${usuario.email }</td>
                <td>
                <button class="btn btn-success"> <i class="far fa-edit"></i></button>
                <button class="btn btn-danger" onclick="eliminarUsuario(${usuario.id_personal})"><i class="fas fa-user-minus"></i></button>
                </td>
                </tr>
                `);
             });

        }

    });
    $('#modal-eliminar').modal('hide');
}

// validaciones;
var campos = [
    {id: 'input-correo', valido: false},
];
var idEliminar;

function validarCampoVacio(){
        campos.forEach(valor=>{
            ($('#'+valor.id).val() === '')?valor.valido = false:valor.valido = true;
        });
}

function validar(){
    validarCampoVacio();
    console.log(campos);
    
    for(let i = 0;i<campos.length;i++)
        marcar(campos[i]);

    for(let i =0 ;i<campos.length;i++){
        if(campos[i].valido == false)
        return;
    }


}

