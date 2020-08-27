<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductReview extends Model
{
    function get_user() {
        return $this->hasOne('App\User','id','user');
    }
}
