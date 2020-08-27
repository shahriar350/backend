<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Product extends Model
{
    use SoftDeletes;
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
    function get_image(){
        return $this->hasOne('App\ProductImage','product','id');
    }
    function get_options(){
        return $this->hasMany('App\ProductOption','product','id');
    }
    function get_shops(){
        return $this->hasMany('App\ProductShop','product','id');
    }
    function get_tags() {
        return $this->hasMany('App\ProductTag','product','id');
    }
}
