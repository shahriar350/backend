<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductShopLocation extends Model
{
    function get_location(){
        return $this->hasOne('App\ShopLocation','id','location');
    }
}
