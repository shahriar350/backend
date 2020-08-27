<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\UserProductClick;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    function user_click(Request $request){
        $request->validate([
            'product' => 'required'
        ]);
        $proId = decrypt($request->product);
        if ($request->product) {
            if (auth()->check() && UserProductClick::where('user',auth()->user()->id)->where('product',$proId)->count() === 0) {
                $user_click = new UserProductClick();
                $user_click->user = auth()->user()->id;
                $user_click->product = $proId;
                $user_click->save();
                return response('ok',200);
            } elseif (UserProductClick::where('mac',substr(exec('getmac'), 0, 17))->where('product',$proId)->count() === 0) {
                $user_click = new UserProductClick();
                $user_click->mac = substr(exec('getmac'), 0, 17);
                $user_click->product = $proId;
                $user_click->save();
            }
        }
    }


}
