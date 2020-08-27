<?php

namespace App\Http\Resources\Api\frontend;

use App\Http\Resources\Api\product\ProductImagesResource;
use App\Http\Resources\Api\product\ProductOptionResource;
use App\ProductShopLocation;
use Carbon\Carbon;
use Illuminate\Http\Resources\Json\JsonResource;

class ProductResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param \Illuminate\Http\Request $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => encrypt($this->id),
            'url' => $this->url,
            'name' => ucfirst($this->name),
            'price' => (float)$this->price,
            'offer_price' =>
                $this->offerStatus === 1
                    ? $this->offerStart && $this->offerEnd
                    ? Carbon::now() >= Carbon::parse($this->offerStart) && Carbon::now() <= Carbon::parse($this->offerEnd)
                        ? $this->offerPrice
                        : 0
                    : $this->offerPrice
                    : 0,
            'offer_type' => $this->offerStatus === 1 ? $this->offerType : null,
            'offer_min_buy' => $this->offerStatus === 1 ? $this->offerMinimumBuy : 0,
            'offer' => $this->offerStatus === 1
                ? $this->offerStart && $this->offerEnd
                    ? (Carbon::now() < Carbon::parse($this->offerStart)) || (Carbon::now() > Carbon::parse($this->offerEnd))
                        ? Carbon::now() >= Carbon::parse($this->offerStart)
                            ? 'end'
                            : 'upcoming'
                        : 'running'
                    : 'unlimited'
                : null,
            'offer_start' =>
                $this->offerStatus === 1 ? $this->offerStart : null,
            'offer_end' =>
                $this->offerStatus === 1 ? Carbon::parse($this->offerEnd) : null,
            'images' => ProductImagesResource::collection($this->whenLoaded('get_images')),
            'options' => ProductOptionResource::collection($this->whenLoaded('get_options')),
            'shops' => ProductShopResource::collection($this->whenLoaded('get_shops')),
            'start' => Carbon::now() >= Carbon::parse($this->offerStart),
            'end' => Carbon::now() <= Carbon::parse($this->offerEnd),
        ];
    }
}
