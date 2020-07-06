<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Shop extends Model
{
    use SoftDeletes;
    protected $fillable= [
        'seller'
    ];
    function get_locations(){
        return $this->hasMany('App\ShopLocation','shop','id');
    }
    function get_banners(){
        return $this->hasMany('App\ShopBanner','shop','id');
    }
    function get_single_banners(){
        return $this->hasOne('App\ShopBanner','shop','id');
    }
}
