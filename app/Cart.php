<?php

namespace App;

use App\Events\CartEvent;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Cart extends Model
{
    use SoftDeletes;
    protected $dispatchesEvents = [
        'updated' => CartEvent::class,
        'deleted' => CartEvent::class,
    ];
    function get_products() {
        return $this->hasMany('App\CartProduct','cart','id');
    }
}
