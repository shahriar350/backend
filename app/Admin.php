<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laratrust\Traits\LaratrustUserTrait;

class Admin extends Authenticatable
{
    use LaratrustUserTrait, Notifiable;
    protected $guard = 'admin';

    protected $fillable = [
        'name', 'user_name', 'password',
    ];

    protected $hidden = [
        'password', 'remember_token',
    ];
}
