<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Pet;
use App\Vote;

use Auth;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        // $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
    	$pets = Pet::withCount('vote')->with('user', 'photo', 'vote')->orderby('vote_count', 'desc')->get();
        // return $pets;

        $user_id = Auth::id();

        $userVote = Vote::where('user_id', $user_id)->get();

        $user_vote = count($userVote);

        return view('home', compact('pets', 'user_vote'));
    }
}
