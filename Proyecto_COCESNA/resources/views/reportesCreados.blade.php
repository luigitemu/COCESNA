@extends('plantillas.plantilla1')

@section('tituloPagina','Reportes creados')

@section('cuerpoPagina')
  <h3 class="d-flex justify-content-center mt-3">Reportes creados</h3>
  <br>
  <div class="container">
    {{-- <div class="row mb-4">
      <div class="col-12">
        {!! $chart1->container() !!}
      </div>
    </div>
    <div class="row mb-4">
      <div class="col-12">
        {!! $chart2->container() !!}
      </div>
    </div>
    <br>
    <div class="row mb-4">
      <div class="col-12">
        {!! $chart3->container() !!}
      </div>
    </div>
    <div class="row mb-4">
      <div class="col-12">
        {!! $chart4->container() !!}
      </div>
    </div> --}}    
    
    @foreach ($reportes as $reporte)
      <div class="row mb-4">
        <div class="col-12">
          {!! $reporte->container() !!}
        </div>
      </div>
    @endforeach

  </div>

@endsection

@section('scripts')
  <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js" charset="utf-8"></script>
  -->
  <script src="{{ asset('vendor/js/chart.js') }}" charset="utf-8"></script>
  {{-- {!! $chart1->script() !!}
  {!! $chart2->script() !!}
  {!! $chart3->script() !!}
  {!! $chart4->script() !!} --}}

  @foreach ($reportes as $reporte)
    {!! $reporte->script() !!}
  @endforeach
@endsection