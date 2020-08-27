<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Order extends Model
{
    use SoftDeletes;
    function get_products() {
        return $this->hasMany('App\OrderProduct','order','id');
    }
}
