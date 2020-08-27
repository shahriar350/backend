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
Route::post('/user/verification/{id}', 'AuthController@verify');
Route::get('/bongo/product/init','api\FrontendController@index');
Route::get('/bongo/product/{url}','api\FrontendController@singleProduct');
Route::get('/user/product/{id}/related/buy','api\FrontendController@relatedBuyProduct');
Route::get('/user/product/{id}/rating','api\FrontendController@rating_product');

Route::get('/user/cart/product/count','api\CartController@cart_count');
Route::post('/user/click/product','api\ProductController@user_click');


Route::group(['middleware' => 'auth:sanctum'], function () {
    Route::post('user/seller/request', 'api\SellerProfileController@seller_request');
    Route::get('user/cart/all', 'api\CartController@cart_all');
    Route::post('/user/address/add','api\CartController@add_address');
    Route::get('/user/address','api\CartController@all_address');
    Route::post('/user/address/default/change/{id}','api\CartController@default_address_change');
    Route::post('/user/address/remove/{id}','api\CartController@remove_address');
    //cart
    Route::post('/user/cart/add','api\CartController@addToCart');
    //order
    Route::post('/user/order/now','api\CartController@orderNow');
    Route::get('/user/order/all','api\CartController@orderAll');
    Route::post('/user/order/product/receive/{id}','api\CartController@orderProductReceive');
    Route::post('/user/order/product/rating','api\CartController@orderProductRating');
    Route::group(['middleware' => 'seller'],function (){
        //order
        Route::get('/seller/product/order/new/all','api\SellerProductController@total_new_order');
        Route::get('/seller/product/order/processing/all','api\SellerProductController@total_processing_order');
        Route::post('/seller/product/order/status/{order_product}','api\SellerProductController@order_status');

        Route::get('/seller/dashboard/information','api\SellerDashboardController@dashboard');

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
        //product
        Route::get('/seller/product/init',"api\SellerProductController@initProduct");
        Route::post('/seller/product/basic/upload',"api\SellerProductController@basicUpload");
        Route::get('/seller/product/check/{id}',"api\SellerProductController@checkProduct");
        Route::post('/seller/product/image/upload/{id}',"api\SellerProductController@uploadImage");
        Route::get('/seller/product/image/all/{id}',"api\SellerProductController@allProductImage");
        Route::post('/seller/product/{product_id}/image/delete/{image_id}',"api\SellerProductController@deleteProductImage");
        //product option
        Route::post('/seller/{product_id}/option/bundle',"api\SellerProductController@optionBundle");
        Route::post('/seller/{product_id}/option/size',"api\SellerProductController@optionSize");
        Route::post('/seller/{product_id}/option/color',"api\SellerProductController@optionColor");
        Route::post('/seller/{product_id}/option/custom',"api\SellerProductController@optionCustom");
        Route::get('/seller/{product_id}/option/all',"api\SellerProductController@optionAll");
        Route::post('/seller/{product_id}/{option}/{child}/image',"api\SellerProductController@optionImage");
        Route::post('/seller/{product_id}/{option}/{child}/image/remove',"api\SellerProductController@optionImageRemove");
        Route::get('/seller/product/all',"api\SellerProductController@allProduct");
        Route::get('/seller/product/{productUrl}',"api\SellerProductController@singleProduct");
        Route::get('/seller/product/{productId}/available/{shopId}',"api\SellerProductController@availableLocation");
        //update seller product
        Route::post('/seller/product/{productId}/general/update',"api\SellerProductController@updateGeneral");
        Route::post('/seller/product/{productId}/available/shop',"api\SellerProductController@availableShop");
        Route::post('/seller/{productId}/{shopId}/location/update',"api\SellerProductController@updateProductShopLoc");
        Route::post('/seller/{productId}/{shopId}/update/shop',"api\SellerProductController@updateProductShopQuan");
        Route::post('/seller/{productId}/update/shop/available',"api\SellerProductController@updateProductShopQuan");
        Route::post('/seller/{productId}/update/shop/added',"api\SellerProductController@addProductShop");
        //option
        Route::post('/seller/{product_id}/{option_id}/option/update',"api\SellerProductController@updateProductOption");
        //most selling product
        Route::get('/seller/product/most/selling',"api\SellerDashboardController@most_selling");

    });
});




