<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ShopBanner extends Model
{
    function get_shop(){
        return $this->hasOne('App\Shop','id','shop');
    }
}
