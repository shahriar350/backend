<?php

namespace App\Http\Resources\Api\Order;

use App\Http\Resources\Api\product\ProductOptionDetailResource;
use Illuminate\Http\Resources\Json\JsonResource;

class OrderProductOpionResource extends JsonResource
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
            'option' => new ProductOptionDetailResource($this->whenLoaded('get_option_details')),
        ];
    }
}
