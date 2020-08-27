<?php

namespace App\Http\Resources\Api\product;

use Illuminate\Http\Resources\Json\JsonResource;

class ShopAddResource extends JsonResource
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
            'name' => ucfirst($this->name),
            'url' => $this->url,
            'description' => $this->description,
            'locations' => ShopLocationResource::collection($this->whenLoaded('get_locations')),
        ];
    }
}
