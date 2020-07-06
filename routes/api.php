<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('/register', 'AuthController@register');
Route::post('/login', 'AuthController@login');

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return new \App\Http\Resources\UserResource($request->user());
});

Route::get('/', function () {
    broadcast(new \App\Events\DemoEvent('hello'));
    return 'ok';
});
Route::post('/user/verification/{id}', 'AuthController@verify');
Route::group(['middleware' => 'auth:sanctum'], function () {
    Route::post('user/seller/request', 'api\SellerProfileController@seller_request');
    Route::group(['middleware' => 'seller'],function (){
        Route::post('seller/new/shop',"api\SellerProfileController@newShop");
        Route::get('seller/new/shop/image/{url}',"api\SellerProfileController@shop_loc_uuid");
        Route::post('seller/shop/image',"api\SellerProfileController@shop_image_upload");
        Route::post('seller/shop/image/delete',"api\SellerProfileController@shop_image_delete");
        Route::post('seller/location/image/delete',"api\SellerProfileController@location_image_delete");
        Route::post('seller/location/image',"api\SellerProfileController@location_image_upload");
        Route::get('/seller/shop/all',"api\SellerProfileController@shop_total");
        Route::get('/seller/shop/single/{id}',"api\SellerProfileController@shop_one_view");
        Route::post('/seller/shop/trash/{id}',"api\SellerProfileController@shop_delete");
        Route::post('/seller/shop/{id}',"api\SellerProfileController@shop_delete");
        Route::post('/seller/shop/location/delete/{id}',"api\SellerProfileController@location_delete");
        Route::post('/seller/shop/location/info/update/{id}',"api\SellerProfileController@location_info_update");
        Route::post('/seller/shop/location/add/{id}',"api\SellerProfileController@location_add");
    });
});




