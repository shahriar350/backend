<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Http\Resources\Api\product\ProductMinResource;
use App\OrderProduct;
use App\OrderProductStatus;
use App\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SellerDashboardController extends Controller
{
    function seller_id() {
        return auth()->user()->get_seller->id;
    }
    function dashboard() {
        $product = Product::where('seller',$this->seller_id())->count();
        $order = OrderProduct::where('seller',$this->seller_id())->get();
        $complete_order = collect($order)->where('status',5)->count();
        $init_order = collect($order)->where('status',0)->count();
        $total_order = collect($order)->count();
        return response()->json(['total_product' => $product, 'complete' => $complete_order,'new_order' => $init_order,'total_order' => $total_order]);
    }
    function most_selling() {
//        return 'ok';
        $seller_product = collect(Product::where('seller',$this->seller_id())->get());
        $pro_ids = $seller_product->pluck('id');
//        $order_pros = OrderProduct::whereIn('product', $pro_ids)
//            ->selectRaw('count(*) as total')
//            ->orderBy('product', 'desc')->get();
        $order_pros = OrderProduct::withTrashed()->select('product', DB::raw('COUNT(product) as count'))
            ->groupBy('product')
            ->orderBy('count', 'desc')
            ->get();
        $products = [];
        foreach ($order_pros as $order_pro){
            $product = new ProductMinResource(Product::with('get_image')->where('id',$order_pro->product)->first());
            $product = collect($product)->put('total',$order_pro->count);
            array_push($products,$product);
        }
        return response()->json(['data' => $products]);
    }
}
