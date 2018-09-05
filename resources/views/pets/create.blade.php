@extends('layouts.app')

@section('content')
	
	<form method="POST" action="{{ route('pets.store')}}" accept-charset="UTF-8" enctype="multipart/form-data">
		{{ csrf_field() }}
		<div class="row info-pets">

			<div class="col-md-12 content-info">
				<label for="nickname">Nickname del dueño:</label>
				<p>
					<input type="text" class="form-control" name="nickname" id="nickname">
					<small id="nameHelp" class="form-text text-muted">Recuerda ingresar el nickname. Este nickname, será único.</small>
				</p>
			</div>

			<div class="col-md-12 content-info">
				<label for="name">Nombre de tu mascota</label>
				<p>
					<input type="text" class="form-control" name="name" id="name">
				</p>
			</div>
			
			<div class="col-md-12 content-info">
				<label for="">Foto:</label>
				<input type="file" class="inputfile" name="image" id="image">
			</div>
		</div>

		<div class="btn-update">
			<button type="submit" class="btn btn-dark"> Publicar</button>
		</div>


	</form>

@endsection