<?php

namespace App\Http\Controllers\api;

use App\Cart;
use App\CartProduct;
use App\CartProductOption;
use App\Http\Controllers\Controller;
use App\Http\Resources\Api\Cart\CartResource;
use App\Http\Resources\Api\Cart\UserAddressResource;
use App\Http\Resources\Api\Order\OrderProductResource;
use App\Http\Resources\Api\Order\OrderResource;
use App\Order;
use App\OrderAddress;
use App\OrderProduct;
use App\OrderProductOption;
use App\OrderProductStatus;
use App\ProductReview;
use App\UserAddress;
use Carbon\Carbon;
use Hashids\Hashids;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class CartController extends Controller
{
    function __construct()
    {
        $this->middleware('auth:sanctum')->except(['cart_count']);
    }

    function user_id()
    {
        return auth()->user()->id;
    }

    function hashid()
    {
        return new Hashids();
    }

    function cart_all()
    {
        $cart = Cart::with('get_products', 'get_products.get_product.get_image')->where('user', $this->user_id())->first();
        if ($cart) {
            return response()->json(['data' => new CartResource($cart)]);
        } else {
            return response()->json(['data' => null]);
        }

    }
    function all_address() {
        $address = UserAddress::where('user',$this->user_id())->get();
        return response()->json(['data' => UserAddressResource::collection($address)]);
    }
    function default_address_change($id){
        $addresses = UserAddress::where('user',$this->user_id())->get();
        if ($addresses->where('id',decrypt($id))->first()) {
            foreach ($addresses as $address){
                if ($address->id === decrypt($id) && $address->default === 0) {
                    $address->default = 1;
                    $address->update();
                } else {
                    if ($address->default === 1) {
                        $address->default = 0;
                        $address->update();
                    }
                }
            }
            return response('',200);
        }
    }
    function remove_address($id){
        $address = UserAddress::where('user',$this->user_id())->where('id',decrypt($id))->first();
        if ($address) {
            $address->delete();
            return response('',200);
        }
    }
    function add_address(Request $request) {
        $request->validate([
            'address' => 'required',
            'address.block' => 'required|regex:/^[a-zA-Z0-9_,+ ]*$/',
            'address.area' => 'required|regex:/^[a-zA-Z0-9_,+ ]*$/',
            'address.road' => 'required|regex:/^[a-zA-Z0-9_,+ ]*$/',
            'address.police_station' => 'required|regex:/^[a-zA-Z0-9_,+ ]*$/',
            'address.post' => 'required|regex:/^[a-zA-Z0-9_,+ ]*$/',
            'address.city' => 'required|regex:/^[a-zA-Z0-9_,+ ]*$/',
            'address.default' => 'required|boolean',
        ]);
        $address = new UserAddress();
        $address->user = $this->user_id();
        $address->house = $request->address['block'];
        $address->area = $request->address['area'];
        $address->road = $request->address['road'];
        $address->police = $request->address['police_station'];
        $address->post = $request->address['post'];
        $address->city = $request->address['city'];
        $address->default = 0;
        if($address->save()){
            return response()->json(['data' => new UserAddressResource($address)]);
        }
    }

    function cart_count()
    {
        if (auth()->check() && auth()->user()->get_cart) {
            $cartCount = CartProduct::where('cart', auth()->user()->get_cart->id)->count();
            return response($cartCount, 200);
        } else {
            return response(0, 200);
        }
    }

    function addToCart(Request $request)
    {
        $request->validate([
            'product' => 'required',
            'quantity' => 'required|numeric|min:1',
            'options' => 'nullable',
            'options.*.child' => 'nullable',
            'options.*.parent' => 'nullable',
        ]);
        $cart = null;
        $already = false;

        if ($cart = Cart::with('get_products')->where('user', $this->user_id())->first()) {
            $already = true;
        } else {
            $cart = new Cart();
            $cart->user = $this->user_id();
            $cart->save();
        }

        $proAv = false;
        $cart_pro_id = null;
        $singleCartPro = null;
        if ($already && $singleCartPro = $cart->get_products->where('product', decrypt($request->product))->first()) {
            $proAv = true;
            $cart_pro_id = $singleCartPro->id;
            $singleCartPro->quantity = $request->quantity;
            $singleCartPro->update();
        }
        if (!$proAv) {
            $cartProduct = new CartProduct();
            $cartProduct->cart = $cart->id;
            $cartProduct->product = decrypt($request->product);
            $cartProduct->quantity = $request->quantity;
            $cartProduct->save();
            $singleCartPro = $cartProduct;
        }
        if (count($request->options) > 0) {
            $opt = $singleCartPro->get_options;
            foreach ($request->options as $option) {
                if (count($opt) > 0 && $spe_op = $opt->where('option_parent', decrypt($option['parent']))
                        ->first()) {
                    if ($spe_op->option !== decrypt($option['child'])) {
                        $spe_op->option = decrypt($option['child']);
                        $spe_op->update();
                    }

                } else {
                    $option_cart_pro = new CartProductOption();
                    $option_cart_pro->cart_product = $singleCartPro->id;
                    $option_cart_pro->option_parent = decrypt($option['parent']);
                    $option_cart_pro->option = decrypt($option['child']);
                    $option_cart_pro->save();
                }
            }
        }
        if (!cache()->has('bongoCartCount')) {
            $cartCount = CartProduct::where('cart', auth()->user()->get_cart->id)->count();
            cache()->forever('bongoCartCount', $cartCount);
        }
        return response(cache()->get('bongoCartCount'), 200);
    }

//    order
    function orderNow()
    {
        $cart = Cart::with('get_products.get_product', 'get_products.get_options.get_option')->where('user', $this->user_id())->first();
        if ($cart) {
            $order = new Order();
            $order->user = $this->user_id();
            $order->cart = auth()->user()->get_cart->id;
            $order->save();
            $order->url = $this->hashid()->encode($order->id) . '-' . Str::uuid();
            if ($order->update()) {
                Cart::findOrFail(auth()->user()->get_cart->id)->delete();
                foreach ($cart->get_products as $cartProduct) {
                    $totalOpt = 0;
                    foreach ($cartProduct->get_options as $option) {
                        if ($option->get_option->price) {
                            $totalOpt += $option->get_option->price;
                        }
                    }
                    $product = $cartProduct->get_product;
                    $price = ($product->price + $totalOpt) * $cartProduct->quantity;
                    $totalPrice = $product->offerStatus === 1 && $product->offerMinimumBy <= $cartProduct->quantity
                        ? $product->offerStart && $product->offerEnd
                            ? (Carbon::now() < Carbon::parse($product->offerStart)) || (Carbon::now() > Carbon::parse($product->offerEnd))
                                ? $price
                                : ($price) - ($price * (($product->offerPrice) / 100))
                            : ($price) - ($price * (($product->offerPrice) / 100))
                        : $price;
                    $order_pro = new OrderProduct();
                    $order_pro->order = $order->id;
                    $order_pro->product = $product->id;
                    $order_pro->seller = $product->seller;
                    $order_pro->quantity = $cartProduct->quantity;
                    $order_pro->offer = $totalPrice === $price ? null : $product->offerPrice;
                    $order_pro->total_price = $totalPrice;
                    if ($order_pro->save()) {
                        $order_pro->url = $this->hashid()->encode($order_pro->id) . '-' . Str::uuid();
                        $order_pro->update();
                        foreach ($cartProduct->get_options as $option){
                            $opt = new OrderProductOption();
                            $opt->order_product = $order_pro->id;
                            $opt->option = $option->get_option->id;
                            $opt->save();
                        }
                    }
                }
                $addDef = UserAddress::where('user',$this->user_id())->where('default','=',1)->first();

                $address = new OrderAddress();
                $address->order = $order->id;
                $address->address = $addDef->id;
                $address->save();

                Cart::where('user',$this->user_id())->delete();
            }
        }
    }
    function orderAll() {
        $orders = Order::with('get_products.get_product.get_image')->where('user',$this->user_id())->get();
        return response()->json(['data' => OrderResource::collection($orders)]);
    }
    function orderProductReceive($id) {
        $orderproduct = OrderProduct::findOrFail(decrypt($id));
        if ($orderproduct) {
            $orderproduct->status = 5;
            $orderproduct->complete = 1;
            $orderproduct->updated_at = Carbon::now();
            $orderproduct->update();
            $id = $orderproduct->id;
            $product = $orderproduct->product;
            $orderproduct->delete();
            if(OrderProduct::where('order','=',$orderproduct->order)->count() < 1){
                $orderUp = $orderproduct->get_order->delete();
                return response()->json(['order' => encrypt($id), 'product' => encrypt($product),'message' => 'empty'],200);
            }
            return response()->json(['order' => encrypt($id), 'product' => encrypt($product)],200);
        }
    }
    function orderProductRating(Request $request) {
        $request->validate([
            'product' => 'required',
            'order' => 'required',
            'message' => "nullable|regex:/^[a-zA-Z0-9_.,+ ]*$/",
            'rating' => 'required|min:1|max:5|integer',
        ]);

        $order_product = OrderProduct::onlyTrashed()->where('id',decrypt($request->order))->where('product',decrypt($request->product))->first();
        if ($order_product) {
            $review = new ProductReview();
            $review->product = $order_product->product;
            $review->order_product = $order_product->id;
            $review->user = $this->user_id();
            $review->rating = $request->rating;
            $review->description = $request->message;
            $review->save();

            return response('',200);
        }
    }
}
