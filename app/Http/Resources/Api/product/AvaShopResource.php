<?php

namespace App\Http\Resources\Api\product;

use Illuminate\Http\Resources\Json\JsonResource;

class AvaShopResource extends JsonResource
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
            'add' => 0,
            'locations' => AvaShopLocationResource::collection($this->whenLoaded('get_locations'))
        ];
    }
}
