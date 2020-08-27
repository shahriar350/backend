<?php

namespace App\Http\Resources\Api\frontend;

use Illuminate\Http\Resources\Json\JsonResource;

class ProductReviewResource extends JsonResource
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
            'name' => ucfirst($this->get_user->name),
            'rating' => $this->rating,
            'description' => $this->description,
        ];
    }
}
