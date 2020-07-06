<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ShopLocation extends Model
{
    use SoftDeletes;
    protected $fillable = [
        'shop'
    ];
    function get_shop(){
        return $this->hasOne('App\Shop','id','shop');
    }
    function get_banners(){
        return $this->hasMany('App\ShopLocationBanner','location','id');
    }
}
