{{--  todo esto se Modifico  --}}
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <script src="https://kit.fontawesome.com/08f90d9e82.js"></script>
  <title>COCESNA</title>
  <link rel="shortcut icon" href="img/icon.png" type="image/x-icon">
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"><!-- Bootstrap core CSS -->
  <link href="css/simple-sidebar.css" rel="stylesheet"><!-- Custom styles for this template -->
  <link rel="stylesheet" href="css/crear-areas.css">
  <script src="vendor/FontAwesome/js/all.js"></script>
</head>

<body>

  <div class="d-flex" id="wrapper">

    <!-- Sidebar -->
    <div class="bg-light border-right" id="sidebar-wrapper">
      <div class="sidebar-heading"> <i class="fas fa-users-cog mr-1"></i>Administrador </div>
      <div class="list-group list-group-flush">
        <a href="/pagPriAdm" class="list-group-item list-group-item-action bg-light">Area de Preguntas</a>
        <a href="/usuarios" class="list-group-item list-group-item-action bg-light">Usuarios</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">Overview</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">Events</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">Profile</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">Status</a>
      </div>
    </div>
    <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <div id="page-content-wrapper">

      <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom" id="navbar">
        <!-- <button class="btn btn-primary" id="menu-toggle">Ocultar</button> -->

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
            <li class="nav-item active">
              <a class="nav-link" href="/pagPriAdm">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Salir</a>
            </li>
          </ul>
        </div>
      </nav>

      <div class="container-fluid">
            @yield('tituloDashboard')
       <div class="row" id="areaPreguntas">

            @yield('cartas')


        </div>
        @yield('modalEliminar')
        </div>
        </div>
        <!-- /#page-content-wrapper -->

        </div>
        <!-- /#wrapper -->
        <!-- modal -->
        <!-- Button trigger modal -->

        <!--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalAgregarPregunta">Launch demo modal</button>-->
        <!-- Modal -->
        <div class="modal fade" id="modalAgregarPregunta" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
        <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Crear Area de Preguntas</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form>
            <div class="form-group">
              <label for="recipient-name" class="col-form-label">Nombre:</label>
              <input type="text" class="form-control" id="nombre">
              <div id="valida-nombre"></div>
            </div>
            <div class="form-group">
              <label for="message-text" class="col-form-label">Descripcion :</label>
              <textarea class="form-control" id="descripcion"></textarea>
              <div id="valida-descripcion"></div>
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
          <button type="button" class="btn btn-primary" onclick="validar();">Guardar Cambios</button>
        </div>
        </div>
        </div>
        </div>

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="vendor/js/main.js"></script>

        <!-- Menu Toggle Script -->
        <script>
        $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
        });


        </script>

        @yield('scripts')

        </body>

        </html>
