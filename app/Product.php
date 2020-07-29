<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $dates = [
       'offerStart',
        'offerEnd ',
    ];
    protected $fillable = [
        'url'
    ];

    function get_images(){
        return $this->hasMany('App\ProductImage','product','id');
    }
}
