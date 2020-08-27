<?php

namespace App\Http\Resources\Api\Shop;

use Illuminate\Http\Resources\Json\JsonResource;
use Intervention\Image\Facades\Image;

class ShopBannerResource extends JsonResource
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
//            'banner' => 'data:image/'.pathinfo(public_path().'/api/shop/'.
//                    $this->image,PATHINFO_EXTENSION).';base64,'
//                .base64_encode(file_get_contents(public_path().'/api/shop/'
//                    .$this->image))
            'banner' => file_exists(public_path().'/api/shop/'.$this->image) ? (string) Image::make('api/shop/'.$this->image)->resize(null,300)->encode('data-url') : null,
        ];
    }
}
