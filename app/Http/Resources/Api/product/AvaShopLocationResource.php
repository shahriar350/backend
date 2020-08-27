<?php

namespace App\Http\Resources\Api\product;

use Illuminate\Http\Resources\Json\JsonResource;

class AvaShopLocationResource extends JsonResource
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
            'add' => 0,
            'id' => encrypt($this->id),
            'block' => ucfirst($this->block_house),
            'road' => ucfirst($this->road),
            'area' => ucfirst($this->area),
            'city' => ucfirst($this->city),
            'police' => ucfirst($this->police),
            'post' => ucfirst($this->post),
            'shopping' => isset($this->shopping_complex) ? ucfirst($this->shopping_complex) : null,
            'floor' => isset($this->floor) ? $this->floor : null,
            'shop_no' => isset($this->shop_no) ? $this->shop_no : null,
            'quantity' => '',
            'stock' => 0
        ];
    }
}
