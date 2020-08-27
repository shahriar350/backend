<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Hashids\Hashids;

class UserResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        $hashId = new Hashids();
        return [
            'id' => $hashId->encode($this->id) ,
            'name' => ucfirst($this->name),
            'email' => $this->email,
            'seller' => auth()->user()->hasRole('seller') ? true : false,
        ];
    }
}
