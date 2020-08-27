<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class OrderAddress extends Model
{
    function get_address() {
        return $this->hasOne('App\UserAddress','id','address');
    }
}
