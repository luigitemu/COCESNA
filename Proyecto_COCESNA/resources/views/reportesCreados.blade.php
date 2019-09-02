@extends('plantillas.plantilla1')

@section('tituloPagina','Reportes creados')

@section('cuerpoPagina')
  <div class="container">
    <div class="row">
      <div class="col-6" style="width:45%;">
        {!! $chart1->container() !!}
      </div>
      <div class="col-6" style="width:45%;">
        {!! $chart2->container() !!}
      </div>
    </div>
    <div class="row">
      <div class="col-6" style="width:45%;">
        {!! $chart3->container() !!}
      </div>
    </div>
  </div>    
@endsection

@section('scripts')
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js" charset="utf-8"></script>
  {!! $chart1->script() !!}
  {!! $chart2->script() !!}
  {!! $chart3->script() !!}
@endsection