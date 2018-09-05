<div class="col-lg-3 col-md-4 col-sm-12 mb-2">
	<div class="card" style="">
	  <img class="card-img-top" src="{{ asset('storage/'.$pet->photo[0]->image) }}" alt="{{ $pet->name }}">
	  <div class="card-body">
	    <h5 class="card-title">{{ $pet->name }}</h5>
	    <p class="card-text text-muted">Publicado por: {{ $pet->user->nickname }}.</p>
	    <p class="card-text text-muted"><small>{{ $pet->created_at }}</small></p>
	  </div>
	  <div class="card-footer text-muted">
	  	@guest
	  		<p>Para votar, debes estar registrado.</p>
    	@else 
    		@if ($user_vote > 0)
    			<p>La puntuación de {{ $pet->name }} es de: {{$pet->vote_count}} <i class="fas fa-paw"></i></p>
    			<small>Usted ya ha votado. Sólo puede votar una vez.</small>
    			@else
    			<small>Vota: </small>
				<a href="{{ route('pet.vote', [$pet->id, 1]) }}">
					<i class="fas fa-paw"></i>
				</a>
				<a href="{{ route('pet.vote', [$pet->id, 2]) }}">
					<i class="fas fa-paw"></i>
				</a>
				<a href="{{ route('pet.vote', [$pet->id, 3]) }}">
					<i class="fas fa-paw"></i>
				</a>
				<a href="{{ route('pet.vote', [$pet->id, 4]) }}">
					<i class="fas fa-paw"></i>
				</a>
				<a href="{{ route('pet.vote', [$pet->id, 5]) }}">
					<i class="fas fa-paw"></i>
	    		</a>
    		@endif
    		
    	@endguest
  		</div>
	</div>
</div>