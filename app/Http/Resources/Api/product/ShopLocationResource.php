<?php

namespace App\Http\Resources\Api\product;

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
            'id' => encrypt($this->get_location->id),
            'block' => ucfirst($this->get_location->block_house),
            'road' => ucfirst($this->get_location->road),
            'area' => ucfirst($this->get_location->area),
            'city' => ucfirst($this->get_location->city),
            'police' => ucfirst($this->get_location->police),
            'post' => ucfirst($this->get_location->post),
            'shopping' => ucfirst($this->get_location->shopping_complex),
            'floor' => $this->get_location->floor,
            'shop_no' => $this->get_location->shop_no,
            'quantity' => $this->quantity,
            'stock' => $this->stock,
        ];
    }
}
