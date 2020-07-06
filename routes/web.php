<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


//Route::view('/','admin.master');
Route::group(['middleware' => 'web'],function (){
    Route::get('/bongopanel/auth/register','admin\AuthController@register')->name('admin.register');
    Route::post('/bongopanel/auth/register/now','admin\AuthController@register_now')->name('admin.register.now');
    Route::get('/bongopanel/auth/login','admin\AuthController@login')->name('admin.login');
    Route::post('/bongopanel/auth/login','admin\AuthController@login_now')->name('admin.login.now');
});


Auth::routes();

//Route::get('/home', 'HomeController@index')->name('home');
