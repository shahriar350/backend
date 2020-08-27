<?php

namespace App\Http\Resources\Api\product;

use App\Http\Resources\Api\Shop\ShopResource;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Carbon;

class ProductResource extends JsonResource
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
            'url' => $this->url,
            'name' => ucfirst($this->name),
            'price' => $this->price,
            'description' => $this->description,
            'offerPrice' =>   $this->offerPrice ,
            'offerType' =>   $this->offerType ,
            'offerDate' => [
                'startDate' => Carbon::parse($this->offerStart)->toDateTimeString(),
                'endDate' => Carbon::parse($this->offerEnd)->toDateTimeString(),
            ],
            'offerMin' =>   $this->offerMinimumBuy ,
            'offerStatus' =>   $this->offerStatus,
            'images' => ProductImagesResource::collection($this->whenLoaded('get_images')),
            'shops' => \App\Http\Resources\Api\product\ShopResource::collection($this->whenLoaded('get_shops')),
            'options' => ProductOptionResource::collection($this->whenLoaded('get_options')),
            'tags' => ProductTagResource::collection($this->whenLoaded('get_tags'))
        ];
    }
}
