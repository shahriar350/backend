<?php

namespace App\Http\Resources\Api\frontend;

use App\Http\Resources\Api\product\ShopLocationResource;
use Illuminate\Http\Resources\Json\JsonResource;

class ProductShopLocationResource extends JsonResource
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
            'quantity' => $this->stock ? $this->quantity : 0,
            'location' => new ShopLocationResource($this->whenLoaded('get_location')),
        ];
    }
}
