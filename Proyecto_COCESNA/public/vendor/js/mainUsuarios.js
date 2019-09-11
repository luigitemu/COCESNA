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
