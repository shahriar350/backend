<?php

namespace App\Http\Resources\Api\Cart;

use Illuminate\Http\Resources\Json\JsonResource;

class UserAddressResource extends JsonResource
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
            'house' => $this->house,
            'area' => $this->area,
            'road' => $this->road,
            'police' => $this->police,
            'post' => $this->post,
            'city' => $this->city,
            'default' => $this->default,
        ];
    }
}
