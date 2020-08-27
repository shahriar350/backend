<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductOption extends Model
{
    function get_options(){
        return $this->hasMany('App\ProductOptionDetail','option','id');
    }
}
