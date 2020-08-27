<?php

namespace App\Http\Resources\Api\Order;

use App\Http\Resources\Api\Cart\UserAddressResource;
use Illuminate\Http\Resources\Json\JsonResource;

class OrderLocationResource extends JsonResource
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
            'location' => new UserAddressResource($this->whenLoaded('get_address')),
        ];
    }
}
