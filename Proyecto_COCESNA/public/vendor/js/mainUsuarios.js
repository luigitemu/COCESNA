var idEliminar;
var porEditar;

// validaciones;
var campos = [
    {id: 'input-correo-editar', valido: false, corValido: true},
];

function eliminarUsuario(id) {
    $('#modalEliminar').modal('show');

    idEliminar = id;
    $('#contenidoModal').html(`Está seguro de eliminar el usuario con el número de empleado ${id}`);
}

function confirmarEliminar () {
    $.ajax({
        //url: `pagPriAdm/${id}`,
        url: `${ruta}/${idEliminar}`,
        method: 'get',
        dataType: 'json',
        success: res=>{
            // console.log(res);
            mostrar(res);
            // alert('usuario eliminado');
            $('#modalEliminar').modal('hide');
            location.reload();
        }
    });
}

function mostrar(res) {
    $('#tbl-usuarios').html('');
    res.forEach((usuario)=>{
        $('#tbl-usuarios').append(`
        <tr>
        <th scope="row"> ${usuario.no_empleado}</th>
        <td> ${usuario.nombres} ${usuario.apellidos}</td>
        <td> ${usuario.posicion}</td>
        <td> ${usuario.email}</td>
        <td>
        <button class="btn btn-success" onclick="editarUsuario(${usuario.no_empleado},'${usuario.email}','${usuario.posicion}');"> <i class="far fa-edit"></i></button>
        <button class="btn btn-danger" onclick="eliminarUsuario(${usuario.no_empleado})"><i class="fas fa-user-minus"></i></button>
        </td>
        </tr>
        `);
    });
}

function editarUsuario(noEmp,email,posicion) {
    porEditar = noEmp; 
    $('#modalEditarUsuario').modal('show');
    $('#input-correo-editar').val(email);
    $('#select-posicion').val(posicion).attr("selected", "selected");
    // console.log(posicion);
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
    }else if(valor.corValido == false) {
        $('#'+valor.id).addClass('is-invalid');
        $('#'+valor.id).removeClass('is-valid');
        $('#valida-'+valor.id).removeClass('valid-feedback');
        $('#valida-'+valor.id).addClass('invalid-feedback');
        $('#valida-'+valor.id).html('El campo no es una dirección de correo electronico');
    }else {
        $('#'+valor.id).addClass('is-valid');
        $('#'+valor.id).removeClass('is-invalid');
        $('#valida-'+valor.id).removeClass('invalid-feedback');
        $('#valida-'+valor.id).addClass('valid-feedback');
        $('#valida-'+valor.id).html('Campo Correcto');
    }
    
}


function validarCampoVacio(){
    campos.forEach(valor=>{
        ($('#'+valor.id).val() === '') ? valor.valido = false : valor.valido = true;
        var x = $('#'+valor.id).val();
        var atposition=x.indexOf("@");  
        var dotposition=x.lastIndexOf(".");  
        ( atposition<1 || dotposition<atposition+2 /*|| dotposition+2>=x.length*/ ) ? valor.corValido = false : valor.corValido = true;
    });
}

function validar(tipo){
    if (tipo == null) {

        // console.log('paso por el otro lado');
        validarCampoVacio();
        // console.log(campos);
        
        for(let i = 0;i<campos.length;i++)
            marcar(campos[i]);

        for(let i = 0;i<campos.length;i++){
            if(campos[i].valido == false || campos[i].corValido == false)
                return;
        }
        // console.log('listo');
        let parametros = `no_empleado=${porEditar}&email=${$('#input-correo-editar').val()}&posicion=${$('#select-posicion').val()}`;
        $.ajax({
            url: actualizar,
            method: 'get',
            dataType: 'json',
            data: parametros,
            success: res=>{
                // console.log(res);
                $('#input-correo-editar').removeClass('is-valid','is-invalid');
                $('#valida-input-correo-editar').html('');

                mostrar(res);
                $('#modalEditarUsuario').modal('hide');
            }
        });
    } else {
        // console.log('paso por donde se espera');
        var x = $('#correo-agregar').val();
        var atposition=x.indexOf("@");  
        var dotposition=x.lastIndexOf(".");  
        if ( atposition<1 || dotposition<atposition+2) {
            $('#correo-agregar').addClass('is-invalid');
            $('#valida-correo-agregar').removeClass('valid-feedback');
            $('#valida-correo-agregar').addClass('invalid-feedback');
            $('#valida-correo-agregar').html('El campo es invalido');
            return;
        } else {
            let parametros = `no_empleado=${$('#noEmpleado-agregar').val()}&email=${$('#correo-agregar').val()}&posicion=${$('#posicion-agregar').val()}&turno=${$('#turno-agregar').val()}`;
            $.ajax({
                url: agregarUsuario,
                method: 'get',
                dataType: 'json',
                data: parametros,
                success: res=>{
                    console.log(res);
                    // mostrar(res);
                    $('#modalAgregarUsuario').modal('hide');
                    location.reload();
                }
            });
        }
    }
}






