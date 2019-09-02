@extends('plantillas.dashboard')

@section('tituloDashboard')
<div class="d-sm-flex align-items-center justify-content-between mb-4 mt-3">
    <h1 class="h3 mb-0 text-gray-800">Usuarios</h1>
    <a role="button" class="d-none d-sm-inline-block btn btn-sm btn-area-preg shadow-sm" data-toggle="modal" data-target="#modalAgregarPregunta"><i class="far fa-file-alt mr-1"></i>Agegar Usuario</a>
  </div>
  <hr>

@endsection

@section('cartas')
<table class="table mx-2">
        <thead class="thead-dark">
          <tr>
            <th scope="col"># </th>
            <th scope="col">Nombre</th>
            <th scope="col">Apellido</th>
            <th scope="col">Sexo</th>
            <th scope="col"> Accion</th>
          </tr>
        </thead>
        <tbody>
        @foreach ($usuarios as $usuario)
        <tr>
            <th scope="row">{{ $usuario->id_personal }}</th>
            <td>{{ $usuario->nombres }}</td>
            <td>{{ $usuario->apellidos }}</td>
            <td>{{ $usuario->sexo }}</td>
            <td>
                <button class="btn btn-success"> <i class="far fa-edit"></i></button>
                <button class="btn btn-danger"><i class="fas fa-user-minus"></i></button>
            </td>
        </tr>
        @endforeach


        </tbody>
      </table>

@endsection
