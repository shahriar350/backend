<?php

namespace App;

use App\Events\CartEvent;
use Illuminate\Database\Eloquent\Model;

class CartProductOption extends Model
{
    protected $dispatchesEvents = [
        'created' => CartEvent::class,
        'updated' => CartEvent::class,
        'deleted' => CartEvent::class,
    ];
    function get_option() {
        return $this->hasOne('App\ProductOptionDetail','id','option');
    }
    function get_option_parent() {
        return $this->hasOne('App\ProductOption','id','option_parent');
    }
}
