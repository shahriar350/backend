<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class OrderProductOption extends Model
{
    function get_option_details() {
        return $this->hasOne('App\ProductOptionDetail','id','option');
    }
}
