@extends('layouts.app')

@section('content')

@if (session('success'))
	    <div class="alert alert-success">
	        {{ session('success') }}
	        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
	    </div>
	@endif


	@if (session('danger'))
	    <div class="alert alert-danger">
	        {{ session('danger') }}
	        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
	    </div>
	@endif

	<h1 class="text-center">Vota por tu mascota favorita!</h1>
	<h5 class="text-center text-muted mb-5">Para votar, debes estar registrado</h5>
	<div class="row">
		@foreach($pets as $pet)
		  @include('pets.pet')
		@endforeach
		<div class="col-md-4"></div>
	</div>

@endsection