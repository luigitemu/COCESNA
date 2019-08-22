{{-- Hereda el contenido de plantillas/plantilla1 --}}
@extends('plantillas.plantilla1')

{{-- Cambia el titulo de la pagina --}}
@section('tituloPagina','Iniciar Sesion')

{{-- Contenido de <body> --}}
@section('cuerpoPagina')
    <div style="height:100px;"></div>
    <div class="container">
        <div class="row">
            <div class="col-6 col-sm-6 col-md-6 col-lg-6 col-xl-6 mx-auto border px-5 py-5 text-light shadow-lg rounded-lg" style="background: rgb(49,10,115);
            background: linear-gradient(0deg, rgba(49,10,115,1) 0%, rgba(48,45,253,1) 100%); max-width:500px;">
                <h2 class="d-flex justify-content-center mb-3">Bienvenido</h2>
                <form method="POST" action="{{ route('verificar.empleadoContrasena') }}"> {{-- al presionar "Ingresar" dirige la informacion a la ruta /verif --}}
                    {{method_field('PUT')}}     {{-- cambia de method="POST" a method="PUT" --}}
                    {!! csrf_field() !!}        <!--Proteccion de ataques csrf-->
                    <div class="form-group mb-2">
                        <label for="exampleInputEmail1">Número de empleado</label>
                        <input type="number" name="numeroEmpleado" id="numeroEmpleado" class="form-control" placeholder="Ingrese su número de empleado" value="{{ old('numeroEmpleado') }}"> {{-- mantiene el valor ingresado --}}
                        
                        {{-- Verifica si hay errores en la informacion ingresada 
                             de existir los muestra en texto color rojo --}}
                        <label class="mt-3 ml-3" for="numeroEmpleado" style="color:#ff3300;">
                        @if ($errors->has('numeroEmpleado'))
                            {{$errors->first('numeroEmpleado')}}
                        @endif
                        </label>

                    </div>
                    <div class="form-group mb-4">
                        <label for="exampleInputPassword1">Contraseña</label>
                        <input type="password" name="contrasena" id="contrasena" class="form-control" placeholder="Ingrese su contraseña">
                        <label class="mt-3 ml-3" for="contrasena" style="color:#ff3300;">
                        @if ($errors->has('contrasena'))
                            {{$errors->first('contrasena')}}
                        @endif
                        </label>

                    </div>
                    <div class="d-flex justify-content-center">
                        <button type="submit" class="btn btn-light py-3" style="width:100%; height:100%;">Ingresar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div style="height:100px;"></div>
@endsection
