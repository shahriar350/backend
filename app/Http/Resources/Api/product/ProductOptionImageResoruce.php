<?php

namespace App\Http\Resources\Api\product;

use Illuminate\Http\Resources\Json\JsonResource;

class ProductOptionImageResoruce extends JsonResource
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
            'image' => file_exists(public_path().'/option_image/'.$this->image) ? 'data:image.'.pathinfo(public_path().'/option_image/'.$this->image,PATHINFO_EXTENSION).';base64,'.base64_encode(file_get_contents(public_path().'/option_image/'.$this->image)) : '',
        ];
    }
}
