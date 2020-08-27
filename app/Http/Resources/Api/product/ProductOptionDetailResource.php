<?php

namespace App\Http\Resources\Api\product;

use App\ProductOptionImage;
use Illuminate\Http\Resources\Json\JsonResource;

class ProductOptionDetailResource extends JsonResource
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
            'price' => isset($this->price)? $this->price : 0,
            'image' => new ProductOptionImageResoruce($this->whenLoaded('get_images'))
        ];
    }
}
