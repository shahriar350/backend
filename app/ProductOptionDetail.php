<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductOptionDetail extends Model
{
    function get_images(){
        return $this->hasOne('App\ProductOptionImage','option_details','id');
    }
}
