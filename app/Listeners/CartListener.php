<?php

namespace App\Listeners;

use App\Cart;
use App\CartProduct;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;

class CartListener
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        cache()->forget('bongoCartCount');
        $cartCount = CartProduct::where('cart',auth()->user()->get_cart->id)->count();
        cache()->forever('bongoCartCount',$cartCount);
    }

    /**
     * Handle the event.
     *
     * @param  object  $event
     * @return void
     */
    public function handle($event)
    {
        //
    }
}
