<?php

namespace App\Http\Resources\Api\Cart;

use App\Http\Resources\Api\product\ProductOptionDetailResource;
use App\Http\Resources\Api\product\ProductOptionResource;
use Illuminate\Http\Resources\Json\JsonResource;

class CartProductOptionResource extends JsonResource
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
            'parent' => new ProductOptionResource($this->whenLoaded('get_option_parent')),
            'option' => new ProductOptionDetailResource($this->whenLoaded('get_option')),
        ];
    }
}
