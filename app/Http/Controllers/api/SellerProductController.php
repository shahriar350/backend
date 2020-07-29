<?php

namespace App\Http\Controllers\api;

use App\Category;
use App\Http\Controllers\Controller;
use App\Http\Resources\Api\CategoryResource;
use App\Http\Resources\api\product\ProductImagesResource;
use App\Http\Resources\Api\Shop\ShopResource;
use App\Product;
use App\ProductCategory;
use App\ProductImage;
use App\ProductShop;
use App\ProductShopLocation;
use App\ProductTag;
use App\Shop;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Image;

class SellerProductController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:sanctum');
        $this->middleware('seller');
    }
    protected function sellerId(){
        return auth()->user()->get_seller->id;
    }
    function initProduct(){
        $cat = CategoryResource::collection(Category::with('children')->whereNull('parent')->get());
        $shops = ShopResource::collection(Shop::with('get_locations')->where('seller',$this->sellerId())->get());
        return response()->json(['categories' => $cat , 'shops' => $shops]);
    }
    function basicUpload(Request $request){

        $request->validate([
            'categories' => 'min:1|required',
            'shops' => 'required',
            'shops.*.locations' => 'required',
            'product' => 'required',
            'product.name' => 'regex:/^([a-zA-Z]+)(\s[a-zA-Z]+)*$/|required',
            'product.price' => 'required|regex:/^\d+(\.\d{1,2})?$/',
            'product.tags' => 'required|min:5|max:15',
            'product.tags.*' => 'required|regex:/^([a-zA-Z0-9]+)(\s[a-zA-Z0-9]+)*$/',
            'product.description' => 'nullable|string',
            'product.offer.minimum' => 'nullable|min:1|max:5',
            'product.offer.offerTime.startDate' => 'nullable|date',
            'product.offer.offerTime.endDate' => 'nullable|date',
            'product.offer.price' => 'nullable|regex:/^\d+(\.\d{1,2})?$/',
            'product.offer.typeOffer' => 'nullable|string',
        ],[
            'categories.min' => 'Minimum one categories must be selected',
            'categories.required' => 'Minimum one categories must be selected',
            'shops.required' => 'Minimum one shop must be selected',
            'shops.*.locations.required' => 'Minimum one shop location must be selected',
            'product' => 'Product input cannot be null',
            'product.name.required' => 'Product name cannot be null',
            'product.name.regex' => "Product name's letter should be A/a to Z/z",
            'product.price.required' => 'Product price cannot be null',
            'product.price.regex' => 'Product price should be 1000 or 1000.12',
            'product.tags.required' => 'Product tags is required',
            'product.tags.min' => 'Minimum 5 product tag should be added',
            'product.tags.max' => 'Minimum 15 product tag can be added',
            'product.tags.*.required' => 'Product tag cannot be null',
            'product.tags.*.regex' => "Product tag's letter should be A/a/0 to Z/z/9",
            'product.offer.minimum.min' => "Product offer will apply to buy minimum product 1",
            'product.offer.minimum.max' => "Product offer will apply to buy maximum product 5",
            'product.offer.price.regex' => "Product offer should be 1000 or 1000.12",
        ]);
        $product = new Product();
        $product->name = $request->product['name'];
        $product->price = $request->product['price'];
        $product->seller = $this->sellerId();
        $product->description = $request->product['description'];
        if($product->save()){
            $product->url = Str::uuid().'-'.$product->id;
            $product->update();
            foreach ($request->product['tags'] as $tag){
                $tagModel = new ProductTag();
                $tagModel->product = $product->id;
                $tagModel->tag = $tag;
                $tagModel->save();
            }
            foreach ($request->get('categories') as $category){
                $cat = new ProductCategory();
                $cat->category = decrypt($category);
                $cat->product = $product->id;
                $cat->save();
            }
            foreach ($request->get('shops') as $shop){
                $proShop = new ProductShop();
                $proShop->product = $product->id;
                $proShop->shop = decrypt($shop['id']);
                $proShop->save();
                if (count($shop['locations']) > 0){
                    foreach ($shop['locations'] as $location){
                        $loc = new ProductShopLocation();
                        $loc->product_shop = $proShop->id;
                        $loc->location = decrypt($location['id']);
                        $loc->save();
                    }
                }
            }
            if (isset($request->product['offer']['price']) && isset($request->product['offer']['minimum'])
                && isset($request->product['offer']['typeOffer'])
                && isset($request->product['offer']['offerTime']['endDate']) && isset($request->product['offer']['offerTime']['startDate'])){
                $product->offerPrice = $request->product['offer']['price'];
                $product->offerStart = $request->product['offer']['offerTime']['startDate'];
                $product->offerEnd = $request->product['offer']['offerTime']['endDate'];
                $product->offerType = $request->product['offer']['typeOffer'];
                $product->offerMinimumBuy = $request->product['offer']['minimum'];
                $product->update();
            }
            return response()->json(['data' => encrypt($product->id)],200);
        }

    }
    function checkProduct($id){
        if (Product::findOrFail(decrypt($id))){
            return response('',200);
        } else {
            return response('',422);
        }
    }
    function uploadImage(Request $request, $id){
        $request->validate([
            'images' => 'required',
            'images.*' => 'image|max:2048|mimes:jpg,jpeg,png'
        ], [
            'images.required' => 'Images are null',
            'images.*.image' => 'Please upload valid images',
            'images.*.mimes' => 'JPG, JPEG, PNG types are only supported',
            'images.*.max' => 'Image size maximum 2 MB'
        ]);
        $product = Product::findOrFail(decrypt($id));
        if ($product){
            if (count($product->get_images) + count($request->images) <= 5){
                foreach ($request->images as $img){
                    $productImage = new ProductImage();
                    $productImage->product = $product->id;
                    $productImage->image = Str::random(8).rand().time().uniqid().'.'.$img->extension();
                    if ($productImage->save()){
                        $img_has = Image::make($img);
//                    $path = 'images/cars/' . $productImage->image;
                        $img_has->fit(1024, 1024);
                        $img_has->save('product/'.$productImage->image);
                    }
                }
                $productImageNow = ProductImagesResource::collection(ProductImage::where('product',decrypt($id))->get());
                return response()->json(['data' => $productImageNow],200);
            } else {
                return response()->json(['message' => 'You can add maximum 5 images'],422);
            }

        }
    }
    function allProductImage($id){
        $productImage = ProductImagesResource::collection(Product::findOrFail(decrypt($id))->get_images);
        return response()->json(['data' => $productImage],200);
    }
    function deleteProductImage($productId,$imageId){
        $product = Product::findOrFail(decrypt($productId));
        if ($product->seller === $this->sellerId()){
            $image = ProductImage::findOrFail(decrypt($imageId));
            $name = $image->image;
            if ($image->product === $product->id){
                $image->delete();
                if (file_exists(public_path() . '/product/' . $name)) {
                    unlink(public_path() . '/product/' . $name);
                }
                return \response('success',200);
            }

        }
    }
}
