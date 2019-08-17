{{-- Hereda el contenido de plantillas/plantilla1 --}}
@extends('plantillas.plantilla1')

{{-- Cambia el titulo de la pagina --}}
@section('tituloPagina','Iniciar Sesion')

{{-- Contenido de <body> --}}
@section('cuerpoPagina')
    <div style="height:100px;"></div>
    <div class="container">
        <div class="row">
            <div class="col-6 col-sm-6 col-md-6 col-lg-6 col-xl-6 mx-auto border px-5 py-5">
                <form method="POST" action="{{ route('verificar.empleadoContrasena') }}"> {{-- al presionar "Ingresar" dirige la informacion a la ruta /verif --}}
                    {{method_field('PUT')}}     {{-- cambia de method="POST" a method="PUT" --}}
                    {!! csrf_field() !!}        <!--Proteccion de ataques csrf-->
                    <div class="form-group mb-4">
                        <label for="exampleInputEmail1">Número de empleado</label>
                        <input type="number" name="numeroEmpleado" id="numeroEmpleado" class="form-control" placeholder="Ingrese su número de empleado" value="{{ old('numeroEmpleado') }}"> {{-- mantiene el valor ingresado --}}
                        
                        {{-- Verifica si hay errores en la informacion ingresada 
                             de existir los muestra en texto color rojo --}}
                        @if ($errors->has('numeroEmpleado'))
                            <br>
                            <label for="numeroEmpleado" class="text-danger">
                                {{$errors->first('numeroEmpleado')}}
                            </label>
                        @endif

                    </div>
                    <div class="form-group mb-4">
                        <label for="exampleInputPassword1">Contraseña</label>
                        <input type="password" name="contrasena" id="contrasena" class="form-control" placeholder="Ingrese su contraseña">
                        
                        @if ($errors->has('contrasena'))
                            <br>
                            <label for="contrasena" class="text-danger">
                                {{$errors->first('contrasena')}}
                            </label>
                        @endif

                    </div>
                    <div class="d-flex justify-content-end">
                        <button type="submit" class="btn btn-success my-3">Ingresar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection
