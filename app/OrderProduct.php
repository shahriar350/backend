<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class OrderProduct extends Model
{
    use SoftDeletes;
    protected $fillable = [
        'url','order','seller','address','total_price','quantity','product','offer'
    ];
    function get_order(){
        return $this->hasOne('App\Order','id','order');
    }
    function get_product() {
        return $this->hasOne('App\Product','id','product');
    }
    function get_address() {
        return $this->hasOne('App\OrderAddress','order','order');
    }
    function get_product_option() {
        return $this->hasMany('App\OrderProductOption','order_product','id');
    }
}
