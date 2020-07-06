<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SellerRequest extends Model
{
    protected $fillable = [
        'user', 'company_name', 'company_name_bn','company_author','company_author_bn','contact','location','location_bn'
    ];
    function get_user(){
        return $this->hasOne('App\User','id','user');
    }
}
