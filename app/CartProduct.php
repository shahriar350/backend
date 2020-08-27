<?php

namespace App;

use App\Events\CartEvent;
use Illuminate\Database\Eloquent\Model;

class CartProduct extends Model
{
    protected $dispatchesEvents = [
        'created' => CartEvent::class,
        'updated' => CartEvent::class,
        'deleted' => CartEvent::class,
    ];
    function get_options() {
        return $this->hasMany('App\CartProductOption','cart_product','id');
    }
    function get_product(){
        return $this->hasOne('App\Product','id','product');
    }
}
