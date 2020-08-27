<?php

namespace App\Http\Resources\Api\product;

use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Storage;

class ProductMinResource extends JsonResource
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
            'name' => ucfirst($this->name),
            'price' => $this->price,
            'image' => new ProductImagesResource($this->whenLoaded('get_image')),
            'images' => ProductImagesResource::collection($this->whenLoaded('get_images')),
            'options' => ProductOptionResource::collection($this->whenLoaded('get_options')),
            'shops' => ShopResource::collection($this->whenLoaded('get_shops'))
        ];
    }
}
