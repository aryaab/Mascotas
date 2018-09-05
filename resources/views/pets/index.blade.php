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

@endsection