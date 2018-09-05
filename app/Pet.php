<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Carbon;

use Jcc\LaravelVote\Vote;

class Pet extends Model
{
    //
    use Vote;

    protected $fillable = [
        'name', 'user_id'
    ];


    public function user() {

    	return $this->belongsTo(User::class);
    }

    public function photo()
    {
    	return $this->hasMany(Photo::class);
    }

    public function Vote()
	{
	    return $this->belongsToMany(User::class, 'votes');
	}

	public function getCreatedAtAttribute($date)
    {
        return Carbon\Carbon::createFromFormat('Y-m-d H:i:s', $date)->format('d-m-Y');
    }

    public function getUpdatedAtAttribute($date)
    {
        return Carbon\Carbon::createFromFormat('Y-m-d H:i:s', $date)->format('d-m-Y');
    }

}