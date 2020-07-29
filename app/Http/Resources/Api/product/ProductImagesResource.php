<?php

namespace App\Http\Resources\api\product;

use Illuminate\Http\Resources\Json\JsonResource;

class ProductImagesResource extends JsonResource
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
            'image' => file_exists(public_path().'/product/'.$this->image) ? 'data:image.'.pathinfo(public_path().'/product/'.$this->image,PATHINFO_EXTENSION).';base64,'.base64_encode(file_get_contents(public_path().'/product/'.$this->image)) : '',
        ];
    }
}
