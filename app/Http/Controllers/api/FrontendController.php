<?php

namespace App\Http\Controllers\api;

use App\Cart;
use App\CartProduct;
use App\Http\Controllers\Controller;
use App\Http\Resources\Api\frontend\ProductReviewResource;
use App\Http\Resources\Api\product\ProductMinResource;
use App\Http\Resources\Api\product\ProductResource;
use App\OrderProduct;
use App\Product;
use App\ProductReview;
use Hashids\Hashids;
use Illuminate\Http\Request;

class FrontendController extends Controller
{
    function hashid()
    {
        return new Hashids();
    }

    function index()
    {
        $latest = Product::with('get_image')->where('active', '=', 1)
            ->latest()->limit(20)->get();
        return response()->json(['latest' => ProductMinResource::collection($latest)]);
    }

    function singleProduct($url)
    {
        $id = $this->hashid()->decode(explode('-', $url)[0])[0];
        $product = Product::with('get_images', 'get_options.get_options.get_images', 'get_shops.get_shop.get_single_banners',
            'get_shops.get_locations')->where('active', '=', 1)
            ->where('id', '=', $id)->first();
        if ($product) {
            return response()->json(['data' => new \App\Http\Resources\Api\frontend\ProductResource($product)]);
        }
    }

    function relatedBuyProduct($id)
    {
        $id = decrypt($id);
        $cartProducts = collect(CartProduct::where('product', $id)->get())->pluck('cart');
        $carts = Cart::with('get_products')->onlyTrashed()->whereIn('id', $cartProducts)->get();
        $related_pro = [];
        $max = 0;
        foreach ($carts as $cart) {
            if ($cart->get_products->count() > $max) {
                $max = $cart->get_products->count();
            }
            foreach ($cart->get_products as $product) {
                if ($product->product !== $id) {
                    array_push($related_pro, $product->product);
                }
            }
        }
        $related_pro = array_keys(array_flip($related_pro));
        $counts = [];
        for ($i = 0; $i < count($related_pro) ; $i++) {
            $counts[$i] = [
                'total' => 0,
                'product' => $related_pro[$i]
            ];
        }
        foreach ($carts as $cart) {
            foreach ($related_pro as $key => $item) {
                $counts[$key]['total'] = (int)$counts[$key]['total'] + $cart->get_products->where('product',$item)->count();
            }
        }

        usort($counts, function($a, $b){
            if($a['total'] == $b['total']) {
                return 0 ;
            }
            return ($a['total'] > $b['total']) ? -1 : 1;
        });
        $new_arr = collect($counts)->pluck('product')->take(4);
        $product = Product::with('get_image')->whereIn('id', $new_arr)->get();
        return response()->json(['data' => ProductMinResource::collection($product)]);
    }

    function rating_product($id) {
        $id = decrypt($id);
        $pro_rev = ProductReview::where('product',$id)->latest()->get();
        $product_review = collect($pro_rev);
        $product_review = collect($pro_rev)->take(4);
        $average = $product_review->pluck('rating')->avg();
        $pro_rev_res = (ProductReviewResource::collection($product_review));
        return response()->json(['data' => $pro_rev_res,'average' => $average]);


    }
}
