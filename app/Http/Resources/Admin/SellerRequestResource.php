<?php

namespace App\Http\Resources\Admin;

use Carbon\Carbon;
use Illuminate\Http\Resources\Json\JsonResource;

class SellerRequestResource extends JsonResource
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
            'id' => $this->id,
            'user' => $this->whenLoaded('get_user'),
            'comapny_name' => $this->company_name,
            'comapny_name_bn' => $this->company_name_bn,
            'comapny_author' => $this->company_author,
            'comapny_author_bn' => $this->company_author_bn,
            'contact' => $this->contact,
            'location' => $this->location,
            'location_bn' => $this->location_bn,
            'created_at' => Carbon::parse($this->created_at)->toDateTimeString(),
            'updated_at' => Carbon::parse($this->updated_at)->toDateTimeString(),
        ];
    }
}
