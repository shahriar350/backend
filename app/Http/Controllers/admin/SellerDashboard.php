<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Http\Resources\Admin\SellerRequestResource;
use App\Role;
use App\Seller;
use App\SellerRequest;
use App\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SellerDashboard extends Controller
{
    function seller_request(){
        return view('admin.seller.request');
    }
    function get_all_request(Request $request){
        if ($request->ajax()){
            $seller_req = SellerRequestResource::collection(SellerRequest::with('get_user')->where('verified',0)->latest()->get());
            return response()->json(['data' => $seller_req],200);
        }
    }
    function active_a_request(Request $request){
        $request->validate([
            'id' => 'required|numeric'
        ]);
        if ($seller = SellerRequest::findOrFail($request->get('id'))){
            if ($request->ajax()){
                $seller->verified_by = $request->user('admin')->id;
                $seller->verified = 1;
                $seller->updated_at = Carbon::now();
                if($seller->update()){
                    if($user = User::findOrFail($seller->user)){
                        $newSeller = new Seller();
                        $newSeller->user = $seller->user;
                        $newSeller->name = $seller->company_author;
                        $newSeller->company_name = $seller->company_name;
                        $newSeller->phone = $seller->contact;
                        $newSeller->save();
                        $sellerRole = Role::where('name','seller')->first();
                        if (DB::table('role_user')->where('role_id','=',$sellerRole->id)->where('user_id','=',$user->id)->where('user_type','=','App\User')->count() === 0){
                            $user->attachRole($sellerRole);
                        }
                        return response('',200);
                    }
                }
            }


        }
    }
}
