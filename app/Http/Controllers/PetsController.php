<?php

namespace App\Http\Controllers;

use App\Pet;
use App\Photo;
use App\User;
use App\Vote;

use DB;
use Auth;

use Illuminate\Http\Request;


class PetsController extends Controller
{
    //

    public function create() 
    {
    	return view('pets.create');
    }

    public function store(Request $request)
    {

    	$data = $request->all();
    	$file = $request->file('image');

    	$user = User::where('nickname', $data['nickname'])->get();

    	DB::transaction(function () use ($data, $user, $file){ 

           
			if (count($user) == 0) {
	    		# code...
	    		$user = new User();
	    		$user->nickname = $data['nickname'];
	    		$user->save();

	    		$pet = new Pet();
	    		$pet->name = $data['name'];
	    		$pet->user_id = $user->id;
	    		$pet->save();
	    	}

	    	$pets= Pet::all();
	    	$pet = $pets->last();

	        if ($file->isValid())
            {
                //
                $name      = $file->getClientOriginalName();
                $extension = $file->getClientOriginalExtension();
                $size      = $file->getSize();
                $filename  = time().'-'.$name;

                \Storage::disk('public')->put($filename,  \File::get($file));

                // $pet = Pet::findOrFail($pet->id);
                $pets = Pet::findOrFail($pet->id);
                
                $image = new Photo();
                $image->image = $filename;
                $image->pet_id = $pet->id;
                $image->save();
            }		

		    return redirect('home')->with('success', 'La foto de tu mascota ha sido publicada!');

        });

		// return redirect('home')->with('danger', 'Ha ocurrido un error, intentalo de nuevo!');	   

    }

    public function votedPet($petid, $vote)
	{

		$user_id = Auth::id();

	  	$pet = Pet::find($petid);
	  	$user = User::find($user_id);

	  	if(! $user || ! $pet) {
	    
	    	return redirect()->back()->with('error', 'El usuario o la mascota no se ha encontrado'); 
	 	}

	 	$vote = new Vote();
	 	$vote->user_id = $user_id;
	 	$vote->pet_id = $petid;
	 	$vote->vote = 2;
	 	$vote->save();

	 	
		return redirect()->back()->with('success', 'Haz votado!.');
	}
}
