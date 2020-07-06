<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $fillable = [
        'parent'
    ];
    function children(){
        return $this->hasMany('App\Category','parent','id');
    }
}
