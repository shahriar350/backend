<?php

namespace App\Http\Resources\Api\Order;

use App\Http\Resources\Api\product\ProductMinResource;
use Illuminate\Http\Resources\Json\JsonResource;

class OrderProductResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => encrypt($this->id),
            'url' => $this->url,
            'status' => $this->status,
            'quantity' => $this->quantity,
            'offer' => $this->offer,
            'total_price' => $this->total_price,
            'address' => new OrderAddressResource($this->whenLoaded('get_address')),
            'product' => new ProductMinResource($this->whenLoaded('get_product')),
            'options' => OrderProductOpionResource::collection($this->whenLoaded('get_product_option')),

        ];
    }
}
