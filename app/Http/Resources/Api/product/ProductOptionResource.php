<?php

namespace App\Http\Resources\Api\product;

use Illuminate\Http\Resources\Json\JsonResource;

class ProductOptionResource extends JsonResource
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
            'options' => ProductOptionDetailResource::collection($this->whenLoaded('get_options')),
        ];
    }
}
