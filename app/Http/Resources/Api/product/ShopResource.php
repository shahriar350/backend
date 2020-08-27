<?php

namespace App\Http\Resources\Api\product;

use Illuminate\Http\Resources\Json\JsonResource;

class ShopResource extends JsonResource
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
            'id' => encrypt($this->get_shop->id),
            'name' => ucfirst($this->get_shop->name),
            'locations' => ShopLocationResource::collection($this->whenLoaded('get_locations'))
        ];
    }
}
