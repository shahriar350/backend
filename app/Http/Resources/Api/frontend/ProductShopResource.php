<?php

namespace App\Http\Resources\Api\frontend;

use App\Http\Resources\Api\Shop\ShopResource;
use Illuminate\Http\Resources\Json\JsonResource;

class ProductShopResource extends JsonResource
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
            'shop' => new ShopResource($this->whenLoaded('get_shop')),
            'product_locations' => ProductShopLocationResource::collection($this->whenLoaded('get_locations')),
        ];
    }
}
