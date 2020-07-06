<?php

namespace App\Http\Controllers\api;

use App\Events\SellerRequestEvent;
use App\Http\Controllers\Controller;
use App\Http\Resources\Admin\SellerRequestResource;
use App\Http\Resources\Api\Shop\ShopBannerResource;
use App\Http\Resources\Api\Shop\ShopLocationResource;
use App\Http\Resources\Api\Shop\ShopResource;
use App\Seller;
use App\SellerRequest;
use App\Shop;
use App\ShopBanner;
use App\ShopLocation;
use App\ShopLocationBanner;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Intervention\Image\ImageManagerStatic as Image;

class SellerProfileController extends Controller
{
//    public function __construct()
//    {
//        $this->middleware('auth:sanctum');
//    }

    protected function authUser()
    {
        return auth()->user();
    }

    protected function sellerid()
    {
        return auth()->user()->get_seller->id;
    }

    function seller_request(Request $request)
    {
        $request->validate([
            'english.shop_name' => 'required',
            'english.shop_author' => 'required',
            'english.location' => 'required',
            'contact' => 'required |unique:seller_requests,contact',
            'check' => 'boolean|required',
        ]);
        if (!auth()->user()->hasRole('seller')) {
            $req = new SellerRequest();
            $req->user = $this->authUser()->id;
            $req->company_name = $request->english['shop_name'];
            $req->company_author = $request->english['shop_author'];
            $req->contact = $request->get('contact');
            $req->location = $request->english['location'];
            if ($req->save()) {
                $data = new SellerRequestResource(SellerRequest::with('get_user')->findOrFail($req->id));
                broadcast(new SellerRequestEvent($data));
                return response('We will contact you soon', 200);
            }
        } else {
            return response('You are already a seller', 200);
        }
    }

    function newShop(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'description' => 'string',
            'locations.*.block_house' => 'required|string',
            'locations.*.area' => 'required|string',
            'locations.*.road' => 'required|string',
            'locations.*.police' => 'required|string',
            'locations.*.post' => 'required|string',
            'locations.*.city' => 'required|string',
        ]);
        try {
            $shop = new Shop();
            $shop->seller = $this->sellerid();
            $shop->name = $request->get('name');
            $shop->url = Str::uuid();
            $shop->description = $request->get('description');
            if ($shop->save()) {
                foreach ($request->get('locations') as $location) {
                    $loc = new ShopLocation();
                    $loc->shop = $shop->id;
                    $loc->block_house = $location['block_house'];
                    $loc->road = $location['road'];
                    $loc->area = $location['area'];
                    $loc->city = $location['city'];
                    $loc->police = $location['police'];
                    $loc->post = $location['post'];
                    if (isset($location['shopping_complex']) && isset($location['floor']) && isset($location['shop_no'])) {
                        $loc->shopping_complex = $location['shopping_complex'];
                        $loc->floor = $location['floor'];
                        $loc->shop_no = $location['shop_no'];
                    }
                    $loc->save();
                }
                return response()->json(['data' => $shop->url], 200);
            }
        } catch (\Exception $exception) {
            if ($shop->id) {
                $shop->forceDelete();
            }
            return response()->json(['message' => 'Something is wrong. Please try again'], 422);
        }
    }

    function shop_loc_uuid($url)
    {
        $shop = new ShopResource(Shop::with('get_locations', 'get_locations.get_banners', 'get_banners')->where('url', '=', $url)->first());
        return response()->json(['data' => $shop], 200);
    }

    function shop_image_upload(Request $request)
    {

        $request->validate([
            'image' => 'required|max:4',
            'image.*' => 'image|mimes:jpg,png,jpeg|max:2048',
            'shop' => 'required'
        ], [
            'image.max' => 'You can upload maximum 4 images',
            'image.*.max' => 'Banner maximum size 2MB',
            'image.*.image' => 'Please provide a valid image',
            'image.*.mimes' => 'JPG, PNG, JPEG images are acceptable',
        ]);
        $shop = decrypt($request->get('shop'));
        if ($shopdir = Shop::where('id', $shop)->where('seller', auth()->user()->get_seller->id)->first()) {
            if (($shopdir->get_banners->count() + count($request->file('image'))) <= 4) {
                try {
                    foreach ($request->file('image') as $img) {
                        $image = new ShopBanner();
                        $image->shop = decrypt($request->shop);
                        $image->image = Str::random(12) . uniqid() . '.' . $img->extension();
                        if ($image->save()) {
                            Image::make(file_get_contents($img))->resize(1200, 400)->save(public_path() . '/api/shop/' . $image->image);
                        }
                    }
                    $banners = ShopBannerResource::collection(Shop::where('id', $shop)->first()->get_banners);
                    return response()->json(['data' => $banners], 200);

                } catch (\Exception $exception) {
                    $banners = ShopBannerResource::collection($shopdir->get_banners);
                    return response()->json(['data' => $banners, 'message' => 'Something is error. Try again'], 422);
                }

            } else {
                return response()->json(['message' => 'Maximum 4 banner can be added'], 422);
            }
        } else {
            return response()->json(['message' => 'Something is error. Try again'], 422);
        }
    }

    function location_image_upload(Request $request)
    {
        $request->validate([
            'image' => 'required|max:4',
            'image.*' => 'image|mimes:jpg,png,jpeg|max:2048',
            'location' => 'required'
        ], [
            'image.max' => 'You can upload maximum 4 images',
            'image.*.max' => 'Banner maximum size 2MB',
            'image.*.image' => 'Please provide a valid image',
            'image.*.mimes' => 'JPG, PNG, JPEG images are acceptable',
        ]);
        $location = decrypt($request->get('location'));
        if ($loc = ShopLocation::where('id', $location)->first()) {
            if ($loc->get_shop->seller = auth()->user()->get_seller->id) {
                if (($loc->get_banners->count() + count($request->file('image'))) <= 4) {
                    try {
                        foreach ($request->file('image') as $img) {
                            $image = new ShopLocationBanner();
                            $image->location = $location;
                            $image->image = Str::random(12) . uniqid() . '.' . $img->extension();
                            if ($image->save()) {
                                Image::make(file_get_contents($img))->resize(1200, 400)->save(public_path() . '/api/shop/' . $image->image);
                            }
                        }
//                        return ShopLocation::where('id',$location)->first()->get_banners;
                        $banners = ShopBannerResource::collection(ShopLocation::where('id', $location)->first()->get_banners);
                        return response()->json(['data' => $banners], 200);

                    } catch (\Exception $exception) {
                        $banners = ShopBannerResource::collection(ShopLocation::where('id', $location)->first()->get_banners);
                        return response()->json(['data' => $banners, 'message' => 'Something is error. Try again'], 422);
                    }

                } else {
                    return response()->json(['message' => 'Maximum 4 banner can be added'], 422);
                }
            }

        } else {
            return response()->json(['message' => 'Something is error. Try again'], 422);
        }
    }

    function shop_image_delete(Request $request)
    {
        $request->validate([
            'id' => 'required'
        ]);
        $id = decrypt($request->get('id'));
        $image = ShopBanner::where('id', $id)->first();
        if ($image->get_shop->seller === auth()->user()->get_seller->id) {
            $name = $image->image;
            if ($image->delete()) {
                if (file_exists(public_path() . '/api/shop/' . $name)) {
                    unlink(public_path() . '/api/shop/' . $name);
                }
                return response('Successfully deleted your image', 200);
            }
        }
    }

    function location_image_delete(Request $request)
    {
        $request->validate([
            'location' => 'required'
        ]);
        $id = decrypt($request->get('location'));
        $image = ShopLocationBanner::where('id', $id)->first();
        if ($image->get_location->get_shop->seller === auth()->user()->get_seller->id) {
            $name = $image->image;
            if ($image->delete()) {
                if (file_exists(public_path() . '/api/shop/' . $name)) {
                    unlink(public_path() . '/api/shop/' . $name);
                }
                return response('Successfully deleted your image', 200);
            }
        }
    }

    function shop_total()
    {
        $shops = ShopResource::collection(Shop::with('get_single_banners')->where('seller', auth()->user()->get_seller->id)->latest()->get());
        return response()->json(['data' => $shops], 200);
    }

    function shop_one_view($id)
    {
        $shop = new ShopResource(Shop::with('get_banners', 'get_locations', 'get_locations.get_banners')->where('id', '=', decrypt($id))->where('seller', '=', $this->sellerid())->first());
        if ($shop) {
            return response()->json(['data' => $shop], 200);
        }
    }

    function shop_delete($id)
    {
        $shop = Shop::where('seller', $this->sellerid())->where('id', decrypt($id))->first();
        if ($shop) {
            if ($shop->delete()) {
                return response('ok', 200);
            }
        }
    }

    function location_delete($id)
    {
        $shoploc = ShopLocation::findOrFail(decrypt($id));
        if ($shoploc && $shoploc->get_shop->seller === $this->sellerid()) {
            if ($shoploc->delete()) {
                return response('', 200);
            }
        }
    }

    function location_info_update(Request $request, $id)
    {
        $loc = ShopLocation::findOrFail(decrypt($id));
        if ($loc && $loc->get_shop->seller === $this->sellerid()) {
            $loc->block_house = $request->block_house;
            $loc->road = $request->road;
            $loc->area = $request->area;
            $loc->city = $request->city;
            $loc->police = $request->police;
            $loc->post = $request->post;
            if (isset($request->shopping_complex) && isset($request->floor) && isset($request->shop_no)) {
                $loc->shopping_complex = $request->shopping_complex;
                $loc->floor = $request->floor;
                $loc->shop_no = $request->shop_no;
            }
            if ($loc->update()) {
                return response('', 200);
            }
        }
    }

    function location_add(Request $request, $id)
    {
        $request->validate([
            'locations.*.block' => 'required|string',
            'locations.*.road' => 'required|string',
            'locations.*.area' => 'required|string',
            'locations.*.city' => 'required|string',
            'locations.*.police_station' => 'required|string',
            'locations.*.post_office' => 'required|string',
        ]);
        $id = decrypt($id);
        $location_shop = Shop::where('id',$id)->first();
        if ($location_shop->seller = $this->sellerid()) {
            $new_loc = [];
            foreach ($request->locations as $location){
                $loc = new ShopLocation();
                $loc->shop = $id;
                $loc->block_house = $location['block'];
                $loc->road = $location['road'];
                $loc->area = $location['area'];
                $loc->city = $location['city'];
                $loc->police = $location['police_station'];
                $loc->post = $location['post_office'];
                if (isset($location['shopping_complex']) && isset($location['floor']) && isset($location['shop_no'])) {
                    $loc->shopping_complex = $location['shopping_complex'];
                    $loc->floor = $location['floor'];
                    $loc->shop_no = $location['shop_no'];
                }
                $loc->save();
                $loc['banners']  = [];
                array_push($new_loc,$loc);
            }
            return response()->json(['data' => ShopLocationResource::collection(ShopLocation::with('get_banners')->where('shop',$location_shop->id)->get())], 200);

        }
    }
}
