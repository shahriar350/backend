<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

Route::group(['prefix' => 'bongopanel'],function (){
    Route::get('/','DashboardController@index')->name('admin.dashboard');
    Route::get('/seller/request','SellerDashboard@seller_request')->name('admin.seller.request');
    Route::get('/api/seller/request','SellerDashboard@get_all_request');
    Route::post('/api/seller/active','SellerDashboard@active_a_request');

    Route::get('categories','ProductRelatedController@category')->name('admin.category');
    Route::post('categories/add','ProductRelatedController@category_post')->name('admin.category.post');
    Route::delete('categories/remove/{id}','ProductRelatedController@category_remove')->name('admin.category.remove');
});
