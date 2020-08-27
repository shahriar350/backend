<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductShop extends Model
{
    function get_shop(){
        return $this->hasOne('App\Shop','id','shop');
    }
    function get_locations(){
        return $this->hasMany('App\ProductShopLocation','product_shop','id');
    }
    function get_all_locations() {
        return $this->hasMany('App\ShopLocation','shop','shop');
    }
}
