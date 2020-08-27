<?php

namespace App\Http\Resources\Api\product;

use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\URL;
use Intervention\Image\Facades\Image;

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
//            'image' => file_exists(public_path().'/product/'.$this->image) ? 'data:image.'.pathinfo(public_path().'/product/'.$this->image,PATHINFO_EXTENSION).';base64,'.base64_encode(file_get_contents(public_path().'/product/'.$this->image)) : '',
//            'image' =>asset('product/'.$this->image)
            'image' => file_exists(public_path().'/product/'.$this->image) ? (string) Image::make('product/'.$this->image)->encode('data-url') : null,

        ];
    }
}
