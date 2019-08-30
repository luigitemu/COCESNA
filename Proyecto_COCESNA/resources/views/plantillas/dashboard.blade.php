<div class="d-flex" id="wrapper">
  <!-- Sidebar -->
  <div class="bg-light border-right" id="sidebar-wrapper">
    <div class="sidebar-heading"> <i class="fas fa-users-cog mr-1"></i>Administrador </div>
    <div class="list-group list-group-flush">
      <a href="#" class="list-group-item list-group-item-action bg-light">Area de Preguntas</a>
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
            <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Salir</a>
          </li>
          <!-- <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Salir
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="#">Salir</a>
              <a class="dropdown-item" href="#">Another action</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">Something else here</a>
            </div>
          </li> -->
        </ul>
      </div>
    </nav>

    <div class="container-fluid">
      <!-- <h1 class="mt-4">Areas de Preguntas</h1> -->
      <div class="d-sm-flex align-items-center justify-content-between mb-4 mt-3">
        <h1 class="h3 mb-0 text-gray-800">Areas De Preguntas</h1>
        <a role="button" class="d-none d-sm-inline-block btn btn-sm btn-area-preg shadow-sm" data-toggle="modal" data-target="#modalAgregarPregunta"><i class="far fa-file-alt mr-1"></i>Crear Area de Preguntas</a>
      </div>
      <hr>
      <div class="row" id="areaPreguntas">
    
      <div class="col-lg-4" id="area1" onclick="mifuncion(this)">
          <div class="card card-style mb-3" >
            <div class="card-header"><span class="mr-1 titulo-enc">Encuesta:</span>Fatiga</div>
            <div class="card-body">
              <h5 class="card-title descripcion-enc">Descripcion</h5>
              <p class="card-text">Conocer el estado de fatiga de los empleados</p>
            </div>
          </div>
        </div>
        <!-- fin de Card -->
      </div>
    </div>
  </div>
</div>


