<?php

namespace App\Http\Resources\Api\Shop;

use Illuminate\Http\Resources\Json\JsonResource;

class ShopLocationResource extends JsonResource
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
            'main_branch' => $this->main_branch,
            'block' => ucfirst($this->block_house),
            'road' => ucfirst($this->road),
            'area' => ucfirst($this->area),
            'city' => ucfirst($this->city),
            'police_station' => ucfirst($this->police),
            'post_office' => ucfirst($this->post),
            'shopping_complex' => isset($this->shopping_complex) ? ucfirst($this->shopping_complex) : null,
            'floor' => isset($this->floor) ? $this->floor : null,
            'shop_no' => isset($this->shop_no) ? $this->shop_no : null,
            'banners' => ShopLocationBannerResource::collection($this->whenLoaded('get_banners')),
        ];
    }
}
