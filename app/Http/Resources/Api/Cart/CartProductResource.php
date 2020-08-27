<?php

namespace App\Http\Resources\Api\Cart;

use App\CartProductOption;
use App\Http\Resources\Api\product\ProductMinResource;
use Carbon\Carbon;
use Illuminate\Http\Resources\Json\JsonResource;

class CartProductResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param \Illuminate\Http\Request $request
     * @return array
     */
    public function toArray($request)
    {
        $totalOpt = 0;
        foreach ($this->get_options as $option){
            $totalOpt+=$option->get_option->price;
        }
        $product = $this->get_product;
        $price = ($product->price + $totalOpt) * $this->quantity;
        $priceWithOffer = ($price) - ($price * (($product->offerPrice) / 100));

        return [
            'id' => encrypt($this->id),
            'total_price' => $product->offerStatus === 1 && $product->offerMinimumBy <= $this->quantity
                ? $product->offerStart && $product->offerEnd
                    ? (Carbon::now() < Carbon::parse($this->offerStart)) || (Carbon::now() > Carbon::parse($this->offerEnd))
                        ? $price
                        : $priceWithOffer
                    : $priceWithOffer
                : $price,
            'quantity' => (int)$this->quantity,
            'product' => new ProductMinResource($this->whenLoaded('get_product')),
            'options' => CartProductOptionResource::collection($this->whenLoaded('get_options'))
        ];
    }
}
