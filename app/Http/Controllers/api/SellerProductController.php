<?php

namespace App\Http\Controllers\api;

use App\Category;
use App\Http\Controllers\Controller;
use App\Http\Resources\Api\CategoryResource;
use App\Http\Resources\Api\frontend\ProductShopResource;
use App\Http\Resources\Api\Order\OrderProductResource;
use App\Http\Resources\Api\Order\OrderProductStatusResource;
use App\Http\Resources\Api\product\AvaShopLocationResource;
use App\Http\Resources\Api\product\AvaShopResource;
use App\Http\Resources\Api\product\ProductImagesResource;
use App\Http\Resources\Api\product\ProductMinResource;
use App\Http\Resources\Api\product\ProductOptionDetailResource;
use App\Http\Resources\Api\product\ProductOptionResource;
use App\Http\Resources\Api\product\ProductResource;
use App\Http\Resources\Api\Shop\ShopLocationResource;
use App\Http\Resources\Api\Shop\ShopResource;
use App\OrderProduct;
use App\OrderProductStatus;
use App\Product;
use App\ProductCategory;
use App\ProductImage;
use App\ProductOption;
use App\ProductOptionDetail;
use App\ProductOptionImage;
use App\ProductShop;
use App\ProductShopLocation;
use App\ProductTag;
use App\Shop;
use App\ShopLocation;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Str;
use Image;
use Hashids\Hashids;

class SellerProductController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:sanctum');
        $this->middleware('seller');
    }

    protected function sellerId()
    {
        return auth()->user()->get_seller->id;
    }

    function initProduct()
    {
        $cat = CategoryResource::collection(Category::with('children')->whereNull('parent')->get());
        $shops = ShopResource::collection(Shop::with('get_locations')->where('seller', $this->sellerId())->get());
        return response()->json(['categories' => $cat, 'shops' => $shops]);
    }

    function basicUpload(Request $request)
    {
        $request->validate([
            'categories' => 'min:1|required',
            'shops' => 'required',
            'shops.*.locations' => 'required',
            'shops.*.locations.*.quantity' => 'required|integer',
            'shops.*.locations.*.stock' => 'required|boolean',
            'product' => 'required',
            'product.name' => 'regex:/^([a-zA-Z0-9 ]+)(\s[a-zA-Z0-9 ]+)*$/|required',
            'product.price' => 'required|regex:/^\d+(\.\d{1,2})?$/',
            'product.tags' => 'required|min:5|max:15',
            'product.tags.*' => 'required|regex:/^([a-zA-Z0-9 ]+)(\s[a-zA-Z0-9 ]+)*$/',
            'product.description' => 'nullable|string',
            'product.offer.minimum' => 'nullable|min:1|max:5',
            'product.offer.offerTime.startDate' => 'nullable|date',
            'product.offer.offerTime.endDate' => 'nullable|date',
            'product.offer.price' => 'nullable|regex:/^\d+(\.\d{1,2})?$/',
            'product.offer.typeOffer' => 'nullable|string',
            'product.offer.active' => 'boolean',
        ], [
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

        if ($request->product['offer']['active']) {
            $product->offerPrice = $request->product['offer']['price'];
            $product->offerStart = $request->product['offer']['offerTime']['startDate'];
            $product->offerEnd = $request->product['offer']['offerTime']['endDate'];
            $product->offerType = $request->product['offer']['typeOffer'];
            $product->offerMinimumBuy = $request->product['offer']['minimum'];
            $product->offerStatus = $request->product['offer']['active'];
        }
        $product->description = $request->product['description'];
        if ($product->save()) {
            $hash = new Hashids();
            $product->url =$hash->encode($product->id,7).'-'.Str::uuid() ;
            $product->update();
            foreach ($request->product['tags'] as $tag) {
                $tagModel = new ProductTag();
                $tagModel->product = $product->id;
                $tagModel->tag = $tag;
                $tagModel->save();
            }
            foreach ($request->get('categories') as $category) {
                $cat = new ProductCategory();
                $cat->category = decrypt($category);
                $cat->product = $product->id;
                $cat->save();
            }
            foreach ($request->get('shops') as $shop) {
                $proShop = new ProductShop();
                $proShop->product = $product->id;
                $proShop->shop = decrypt($shop['id']);
                $proShop->save();
                if (count($shop['locations']) > 0) {
                    foreach ($shop['locations'] as $location) {
                        $loc = new ProductShopLocation();
                        $loc->product_shop = $proShop->id;
                        $loc->quantity = $location['quantity'];
                        $loc->stock = $location['stock'];
                        $loc->location = decrypt($location['id']);
                        $loc->save();
                    }
                }
            }
            if ($request->product['offer']['active']) {
                $product->offerPrice = $request->product['offer']['price'];
                $product->offerStart = $request->product['offer']['offerTime']['startDate'];
                $product->offerEnd = $request->product['offer']['offerTime']['endDate'];
                $product->offerType = $request->product['offer']['typeOffer'];
                $product->offerMinimumBuy = $request->product['offer']['minimum'];
                $product->offerStatus = $request->product['offer']['active'];
                $product->update();
            }
            return response()->json(['data' => encrypt($product->id)], 200);
        }

    }

    function checkProduct($id)
    {
        $product = Product::findOrFail(decrypt($id));
        if ($product && $product->seller === $this->sellerId()) {
            return response('', 200);
        } else {
            return response('', 422);
        }
    }

    function uploadImage(Request $request, $id)
    {
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
        if ($product && $product->seller === $this->sellerId()) {
            if (count($product->get_images) + count($request->images) <= 5) {
                foreach ($request->images as $img) {
                    $productImage = new ProductImage();
                    $productImage->product = $product->id;
                    $productImage->image = Str::random(8) . rand() . time() . uniqid() . '.' . $img->extension();
                    if ($productImage->save()) {
//                        return Http::attach('image',base64_encode(file_get_contents($img)))->post('https://api.imgbb.com/1/upload?expiration=0&key=2213291fd65a5cc3cdaf69f7bb7a8c4f');
                        $img_has = Image::make($img);
                        $img_has->fit(1024, 1024);
                        $img_has->save('product/' . $productImage->image);
                    }
                }
                $product->active = 1;
                $product->update();
                $productImageNow = ProductImagesResource::collection(ProductImage::where('product', decrypt($id))->get());
                return response()->json(['data' => $productImageNow], 200);
            } else {
                return response()->json(['message' => 'You can add maximum 5 images'], 422);
            }

        }
    }

    function allProductImage($id)
    {
        $productImage = ProductImagesResource::collection(Product::findOrFail(decrypt($id))->get_images);
        return response()->json(['data' => $productImage], 200);
    }

    function deleteProductImage($productId, $imageId)
    {
        $product = Product::findOrFail(decrypt($productId));
        if ($product->seller === $this->sellerId()) {
            $image = ProductImage::findOrFail(decrypt($imageId));
            $name = $image->image;
            if ($image->product === $product->id) {
                $image->delete();
                if (file_exists(public_path() . '/product/' . $name)) {
                    unlink(public_path() . '/product/' . $name);
                }
                return \response('success', 200);
            }
        }
    }
    //option
    //bundle
    function optionBundle(Request $request, $productId)
    {
        $request->validate([
            'bundles' => 'required',
            'bundles.*.price' => 'nullable|min:0|regex:/^\d+(\.\d{1,2})?$/',
            'bundles.*.name' => 'required|regex:/^[a-zA-Z0-9_,+\'"  ]*$/'
        ], [
            'bundles.required' => 'Bundle cannot be null',
            'bundles.*.price.required' => 'Bundle price cannot be null',
            'bundles.*.price.regex' => 'Bundle price like this 1000 or 1000.12',
            'bundles.*.name.regex' => 'You can use a-z A-Z 0-9 _ , in bundle name',
            'bundles.*.name.required' => 'Bundle name cannot be null',
        ]);
        $id = decrypt($productId);
        $product = Product::findOrFail($id);
        if ($product && $product->seller === $this->sellerId() && $product->get_options->where('name', 'bundle')->count() <= 0) {
            $optionNew = new ProductOption();
            $optionNew->product = $product->id;
            $optionNew->name = 'bundle';
            $option = $optionNew->save();
            if ($option) {
                foreach ($request->bundles as $bundle) {
                    $optionDetail = new ProductOptionDetail();
                    $optionDetail->option = $optionNew->id;
                    $optionDetail->name = $bundle['name'];
                    $optionDetail->price = $bundle['price'];
                    $optionDetail->save();
                }
                return response()->json(['data' => new ProductOptionResource(ProductOption::with('get_options')->where('product', '=', $product->id)->where('name', '=', 'bundle')->first())]);
            }
        } else {
            if ($product->get_options->where('name', 1)->count() > 0) {
                return response()->json(['message' => ' You have already added a bundle'], 422);
            } else {
                return response()->json(['message' => 'Something is error. Try again'], 422);
            }
        }
    }

    function optionSize(Request $request, $productId)
    {
        $request->validate([
            'sizes' => 'required',
            'sizes.*.price' => 'nullable|regex:/^\d+(\.\d{1,2})?$/',
            'sizes.*.name' => 'required|regex:/^[a-zA-Z0-9_,+\'"  ]*$/'
        ], [
            'sizes.required' => 'Size cannot be null',
            'sizes.*.price.regex' => 'Size price like this 1000 or 1000.12',
            'sizes.*.name.regex' => 'You can use a-z A-Z 0-9 _ , in size name',
            'sizes.*.name.required' => 'Size name cannot be null',
        ]);
        $id = decrypt($productId);
        $product = Product::findOrFail($id);
        if ($product && $product->seller === $this->sellerId() && $product->get_options->where('name', 'size')->count() <= 0) {
            $optionNew = new ProductOption();
            $optionNew->product = $product->id;
            $optionNew->name = 'size';
            $option = $optionNew->save();
            if ($option) {
                foreach ($request->sizes as $size) {
                    $optionDetail = new ProductOptionDetail();
                    $optionDetail->option = $optionNew->id;
                    $optionDetail->name = $size['name'];
                    $optionDetail->price = $size['price'];
                    $optionDetail->save();
                }
                return response()->json(['data' => new ProductOptionResource(ProductOption::with('get_options')->where('product', '=', $product->id)->where('name', '=', 'size')->first())]);

            }
        } else {
            if ($product->get_options->where('name', 3)->count() > 0) {
                return response()->json(['message' => ' You have already added size option'], 422);
            } else {
                return response()->json(['message' => 'Something is error. Try again'], 422);
            }
        }
    }

    function optionColor(Request $request, $productId)
    {
        $request->validate([
            'colors' => 'required',
            'colors.*.price' => 'nullable|regex:/^\d+(\.\d{1,2})?$/',
            'colors.*.name' => 'required|regex:/^[a-zA-Z0-9_,+\'"  ]*$/'
        ], [
            'colors.required' => 'color cannot be null',
            'colors.*.price.regex' => 'color price like this 1000 or 1000.12',
            'colors.*.name.regex' => 'You can use a-z A-Z 0-9 _ , in color name',
            'colors.*.name.required' => 'color name cannot be null',
        ]);
        $id = decrypt($productId);
        $product = Product::findOrFail($id);
        if ($product && $product->seller === $this->sellerId() && $product->get_options->where('name', 'color')->count() <= 0) {
            $optionNew = new ProductOption();
            $optionNew->product = $product->id;
            $optionNew->name = 'color';
            $option = $optionNew->save();
            if ($option) {
                foreach ($request->colors as $color) {
                    $optionDetail = new ProductOptionDetail();
                    $optionDetail->option = $optionNew->id;
                    $optionDetail->name = $color['name'];
                    $optionDetail->price = $color['price'];
                    $optionDetail->save();
                }
                return response()->json(['data' => new ProductOptionResource(ProductOption::with('get_options')->where('product', '=', $product->id)->where('name', '=', 'color')->first())]);

            }
        } else {
            if ($product->get_options->where('name', 2)->count() > 0) {
                return response()->json(['message' => ' You have already added color option'], 422);
            } else {
                return response()->json(['message' => 'Something is error. Try again'], 422);
            }
        }
    }

    function optionCustom(Request $request, $productId)
    {
        $request->validate([
            'option' => 'required',
            'custom' => 'required',
            'custom.*.price' => 'nullable|regex:/^\d+(\.\d{1,2})?$/',
            'custom.*.name' => "required|regex:/^[a-zA-Z0-9_,+'\" ]*$/",
        ], [
            'option.required' => 'Option main name cannot be null',
            'custom.required' => 'Custom option cannot be null',
            'custom.*.price.regex' => 'Custom option price like this 1000 or 1000.12',
            'custom.*.name.regex' => 'You can use a-z A-Z 0-9 _ , in custom option name',
            'custom.*.name.required' => 'custom option name cannot be null',
        ]);
        $id = decrypt($productId);
        $product = Product::findOrFail($id);
        if ($product && $product->seller === $this->sellerId() &&
            $product->get_options->where('name', '<>', 'size')->where('name', '<>', 'color')->where('name', '<>', 'bundle')->count() <= 0) {
            $optionNew = new ProductOption();
            $optionNew->product = $product->id;
            $optionNew->name = $request->option;
            $option = $optionNew->save();
            if ($option) {
                foreach ($request->custom as $customO) {
                    $optionDetail = new ProductOptionDetail();
                    $optionDetail->option = $optionNew->id;
                    $optionDetail->name = $customO['name'];
                    $optionDetail->price = $customO['price'];
                    $optionDetail->save();
                }
                return response()->json(['data' => new ProductOptionResource(ProductOption::with('get_options')->where('product', '=', $product->id)
                    ->where('name', '<>', 'size')->where('name', '<>', 'color')->where('name', '<>', 'bundle')->first())]);
            }
        } else {
            if ($product->get_options->where('name', 4)->count() > 0) {
                return response()->json(['message' => ' You have already added custom option'], 422);
            } else {
                return response()->json(['message' => 'Something is error. Try again'], 422);
            }
        }
    }

    function optionAll($id)
    {
        $product = Product::findOrFail(decrypt($id));
        if ($product && count($product->get_options) > 0 && $product->seller === $this->sellerId()) {
            $option = ProductOptionResource::collection(ProductOption::with('get_options', 'get_options.get_images')->where('product', $product->id)->get());
            return response()->json(['data' => $option,'price' => $product->price]);
        } else {
            return response()->json(['price' => $product->price]);
        }
    }

    function optionImage(Request $request, $productId, $optionId, $childId)
    {
        $request->validate([
            'image' => 'required|image|mimes:jpg,jpeg,png|max:2024'
        ], [
            'image.required' => 'Image file is required',
            'image.image' => 'Enter a valid input',
            'image.max' => 'Maximum size of image is 2MB',
            'image.mimes' => 'JPG, JPEG, PNG types are only support',
        ]);
        $product = Product::with('get_options', 'get_options.get_options', 'get_options.get_options.get_images')->findOrFail(decrypt($productId));
        if ($product && $product->seller === $this->sellerId()) {
            $find = $product->get_options->where('id', decrypt($optionId))->first();
            if ($find && $optionChild = $find->get_options->where('id', decrypt($childId))->first()) {
                if (isset($optionChild->get_images)) {
                    $img = $optionChild->get_images;
                    $name = $img->image;
                    if ($img->delete()) {
                        if (file_exists(public_path() . '/option_image/' . $name)) {
//                            return public_path() . '/option_image/' . $name;
                            unlink(public_path() . '/option_image/' . $name);
                        }
                    }
                }
                $image = new ProductOptionImage();
                $image->option_details = $optionChild->id;
                $image->image = Str::random(8) . rand() . time() . uniqid() . '.' . $request->image->extension();
                if ($image->save()) {
                    $img_has = Image::make($request->image);
                    $img_has->fit(1024, 1024);
                    $img_has->save('option_image/' . $image->image);
                }
                return response()->json(['data' => new ProductOptionDetailResource(ProductOptionDetail::with('get_images')->where('id', '=', $optionChild->id)->first())]);
            }
        }
    }

    function optionImageRemove($productId, $optionId, $childId)
    {
        $product = Product::with('get_options', 'get_options.get_options', 'get_options.get_options.get_images')->findOrFail(decrypt($productId));
        if ($product && $product->seller === $this->sellerId()) {
            $find = $product->get_options->where('id', decrypt($optionId))->first();
            if ($find && $optionChild = $find->get_options->where('id', decrypt($childId))->first()) {
                if (isset($optionChild->get_images)) {
                    $img = $optionChild->get_images;
                    $name = $img->image;
                    if ($img->delete()) {
                        if (file_exists(public_path() . '/option_image/' . $name)) {
                            unlink(public_path() . '/option_image/' . $name);
                            return response()->json(['data' => new ProductOptionDetailResource(ProductOptionDetail::with('get_images')->where('id', '=', $optionChild->id)->first())]);
                        }
                    }
                }
            }
        }
    }

    function allProduct()
    {
        $products = ProductMinResource::collection(Product::with('get_image')->where('seller',$this->sellerId())->latest()->paginate(10));
        $response = [
            'pagination' => [
                'total' => $products->total(),
                'per_page' => $products->perPage(),
                'current_page' => $products->currentPage(),
                'last_page' => $products->lastPage(),
                'from' => $products->firstItem(),
                'to' => $products->lastItem()
            ],
            'data' => $products
        ];
        return response()->json(['data' => $response]);
    }

    function singleProduct($url)
    {
        $product = Product::with('get_shops.get_locations', 'get_images', 'get_options.get_options.get_images', 'get_tags')
            ->where('seller', '=', $this->sellerId())->where('url', '=', $url)->first();
        return response()->json(['data' => new ProductResource($product)]);
    }

    function availableLocation($productId, $shopId)
    {
        $shopId = decrypt($shopId);
        $product = Product::with('get_shops.get_locations')->where('seller', $this->sellerId())->findOrFail(decrypt($productId));

        $shop = Shop::where('seller', $this->sellerId())->where('id', $shopId)->first();

        if ($product && $shop) {
            $shopGet = $product->get_shops->where('shop', '=', $shopId)->first();
            $onlyLoc = collect($shopGet->get_locations)->pluck('location');
            $available = ShopLocation::where('shop', $shop->id)->whereNotIn('id', $onlyLoc)->get();
            return response()->json(['data' => AvaShopLocationResource::collection($available)]);
        }
    }

    function availableShop($productId)
    {
        $productId = decrypt($productId);
        $product = Product::with('get_shops')->where('seller', $this->sellerId())->where('id', $productId)->first();
        if ($product) {
            return response()->json([
                'data' => AvaShopResource::collection(
                    Shop::with('get_locations')->where('seller', $this->sellerId())
                        ->whereNotIn('id', collect($product->get_shops)->pluck('shop'))->get()
                )
            ]);
        }
    }

    //upodate seller product
    function updateGeneral(Request $request, $productId)
    {
//        return $request->offerStatus;
        $request->validate([
            'name' => 'regex:/^([a-zA-Z0-9 ]+)(\s[a-zA-Z0-9 ]+)*$/|required',
            'price' => 'required|regex:/^\d+(\.\d{1,2})?$/',
            'offerPrice' => 'nullable|regex:/^\d+(\.\d{1,2})?$/|required_if:offerStatus,1',
            'offerDate.startDate' => 'nullable|date|required_if:offerStatus,1',
            'offerDate.endDate' => 'nullable|date|required_if:offerStatus,1',
            'offerType' => 'nullable|string|required_if:offerStatus,1',
            'offerMin' => 'nullable|min:1|max:5|required_if:offerStatus,1',
            'offerStatus' => 'boolean|',
            'description' => 'nullable|string',
            'tags' => 'required|min:5|max:15',
            'tags.*.tag' => 'required|regex:/^([a-zA-Z0-9 ]+)(\s[a-zA-Z0-9 ]+)*$/',
        ], [
            'name.required' => 'Product name cannot be null',
            'name.regex' => "Product name's letter should be A/a to Z/z and 0-9",
            'price.required' => 'Product price cannot be null',
            'price.regex' => 'Product price should be 1000 or 1000.12',
            'tags.required' => 'Product tags is required',
            'tags.min' => 'Minimum 5 product tag should be added',
            'tags.max' => 'Minimum 15 product tag can be added',
            'tags.*.required' => 'Product tag cannot be null',
            'tags.*.tag.regex' => "Product tag's letter should be A/a/0 to Z/z/9",
            'offerMin.required_if' => "Minimum quantity to buy for applying offer is required",
            'offerMin.min' => "Product offer will apply to buy minimum product 1",
            'offerMin.max' => "Product offer will apply to buy maximum product 5",
            'offerPrice.regex' => "Product offer price should be 1000 or 1000.12",
            'offerPrice.required_if' => "Product offer price is required",
            'offerDate.startDate.date' => "Product offer date must be date format",
            'offerDate.startDate.required_if' => "Product offer date is required",
            'offerDate.endDate.required_if' => "Product offer date is required",
            'offerType.required_if' => "Product offer type is required",
            'offerDate.endDate.date' => "Product offer date must be date format",
        ]);
        $id = decrypt($productId);
        $product = Product::findOrFail($id);
        if ($product) {
            $product->name = $request->name;
            $product->price = $request->price;
            if ($request->offerStatus) {
                $product->offerPrice = $request->offerPrice;
                $product->offerStart = $request->offerDate['startDate'];
                $product->offerEnd = $request->offerDate['endDate'];
                $product->offerType = $request->offerType;
                $product->offerMinimumBuy = $request->offerMin;
                $product->offerStatus = $request->offerStatus;
            }
            $product->description = $request->description;
            if ($product->update()) {
                ProductTag::where('product', $id)->delete();
                foreach ($request->tags as $tag) {
                    $tagName = new ProductTag();
                    $tagName->product = $product->id;
                    $tagName->tag = $tag['tag'];
                    $tagName->save();
                }
                return response('', 200);
            }
        }
    }

    function updateProductShopLoc(Request $request, $productId, $shopId)
    {
//        return $request->all();
        $request->validate([
            'avaLoc' => 'required|min:1',
            'avaLoc.*.id' => 'required',
            'avaLoc.*.quantity' => 'required|integer|min:0|regex:/^[1-9][\d]*$/',
            'avaLoc.*.stock' => 'required|boolean',
        ], [
            'avaLoc.required' => 'Available location cannot be null',
            'avaLoc.min' => 'Available location cannot be null',
            'avaLoc.*.id.required' => 'Available location id required',
            'avaLoc.*.quantity.required' => 'Available location quantity required',
            'avaLoc.*.quantity.min' => 'Available location quantity must be higher then 0',
            'avaLoc.*.quantity.integer' => 'Available location quantity must be number(0-9)',
            'avaLoc.*.quantity.regex' => 'Available location quantity valid only 1000/1000.12',
            'avaLoc.*.stock.required' => 'Available location product stock is required',
            'avaLoc.*.stock.boolean' => 'Available location product stock must be boolean',
        ]);
        $product = Product::with('get_shops', 'get_shops.get_all_locations', 'get_shops.get_locations')->where('seller', $this->sellerId())->where('id', decrypt($productId))->first();
        $shop = $product->get_shops->where('shop', decrypt($shopId))->first();
        if ($product && $shop) {
            foreach ($request->avaLoc as $location) {
                $locationId = decrypt($location['id']);
                if ($shop->get_all_locations->where('id', '=', $locationId)->count() === 1
                    && $shop->get_locations->where('location', '=', $locationId)->count() <= 0) {
//                    return $locationId;
                    $proLoc = new ProductShopLocation();
                    $proLoc->product_shop = $shop->id;
                    $proLoc->quantity = $location['quantity'];
                    $proLoc->location = $locationId;
                    $proLoc->stock = $location['stock'];
                    $proLoc->save();
                }
            }
            return response()->json(['data' => \App\Http\Resources\Api\product\ShopLocationResource::collection(ProductShopLocation::with('get_location')->where('product_shop', $shop->id)->get())], 200);
//            return ProductShopLocation::with('get_location')->where('product_shop',$shop->id)->get();
        }
    }

    function updateProductShopQuan(Request $request, $productId, $shopId)
    {
        $request->validate([
            'locations' => 'required',
            'locations.*.id' => 'required',
            'locations.*.quantity' => 'required|integer|min:0|regex:/^[1-9][\d]*$/',
            'locations.*.stock' => 'required|boolean',
        ], [
            'locations.required' => 'Location value cannot be null',
            'locations.*.id' => 'Location value cannot be null',
            'locations.*.quantity.required' => 'Location quantity value cannot be null',
            'locations.*.quantity.integer' => 'Location quantity value must be number(0-9)',
            'locations.*.quantity.min' => 'Location quantity value cannot be negative',
            'locations.*.quantity.regex' => 'Location quantity value only 1000/1000.12 like this',
            'locations.*.stock.required' => 'Location value is required',
            'locations.*.stock.boolean' => 'Location value must be boolean',
        ]);
        $shopId = decrypt($shopId);
        $product = Product::with('get_shops.get_locations')->where('seller', $this->sellerId())->where('id', decrypt($productId))->first();
        if ($product) {
            foreach ($request->locations as $location) {
                $locationId = decrypt($location['id']);
                $onlyShop = $product->get_shops->where('shop',$shopId)->first();
                if ($loc = $onlyShop->get_locations->where('location', '=', $locationId)->first()) {
                    $loc->quantity = $location['quantity'];
                    $loc->stock = $location['stock'];
                    $loc->update();
                }
            }
            return response('', 200);
        }
    }

    function addProductShop(Request $request, $productId)
    {
        $request->validate([
            'shops' => 'required',
            'shops.*.id' => 'required',
            'shops.*.locations' => 'required',
            'shops.*.locations.*.quantity' => 'required|integer|min:0|regex:/^[1-9][\d]*$/',
            'shops.*.locations.*.stock' => 'required|boolean',
        ], [
            'shops.required' => 'Please add shop first',
            'shops.*.id.required' => 'Please add shop first',
            'shops.*.locations.*.quantity.required' => 'Location quantity value cannot be null',
            'shops.*.locations.*.quantity.integer' => 'Location quantity value must be number(0-9)',
            'shops.*.locations.*.quantity.min' => 'Location quantity value cannot be negative',
            'shops.*.locations.*.quantity.regex' => 'Location quantity value only 1000/1000.12 like this',
            'shops.*.locations.*.required' => 'Location value is required',
            'shops.*.locations.*.boolean' => 'Location value must be boolean',
        ]);
        $product = Product::with('get_shops')->where('seller', $this->sellerId())->where('id', decrypt($productId))->first();
        if ($product) {
            foreach ($request->shops as $shop) {
                $shopSin = Shop::with('get_locations')->where('seller', $this->sellerId())->where('id', decrypt($shop['id']))->first();
                if ($shopSin && $product->get_shops->where('shop', $shopSin->id)->count() === 0) {
                    $newProShop = new ProductShop();
                    $newProShop->product = $product->id;
                    $newProShop->shop = $shopSin->id;
                    $newProShop->save();
                    foreach ($shop['locations'] as $location) {
                        if ($loc = $shopSin->get_locations->where('id', decrypt($location['id']))->first()) {
//                            return [$shopSin->get_locations,decrypt($location['id'])];
                            $newShopLoc = new ProductShopLocation();
                            $newShopLoc->product_shop = $newProShop->id;
                            $newShopLoc->quantity = $location['quantity'];
                            $newShopLoc->location = $loc->id;
                            $newShopLoc->stock = $location['stock'];
                            $newShopLoc->save();
                        }
                    }
                }
            }
            return response()->json(['data' => \App\Http\Resources\Api\product\ShopResource::collection(ProductShop::with('get_locations')->where('product',$product->id)->get())]);
        }
    }
    function updateProductOption(Request $request,$productid,$optionid) {
        $request->validate([
            'options' => 'required',
            'options.*.id' => 'required',
            'options.*.name' => 'required|string|regex:/^([a-zA-Z0-9 ]+)(\s[a-zA-Z0-9 ]+)*$/',
            'options.*.price' => 'nullable|min:0|integer|regex:/^\d+(\.\d{1,2})?$/',
        ],[
            'options.required' => 'Option cannot be null',
            'options.*.id.required' => 'Option cannot be null',
            'options.*.name.required' => 'Option name cannot be null',
            'options.*.name.string' => 'Option name must be string',
            'options.*.name.regex' => 'Option name must be alpha',
            'options.*.price.regex' => 'Option price value only 1000/1000.12 like this',
            'options.*.price.min' => 'Option price minimum 0',
            'options.*.price.integer' => 'Option price must be integer',
        ]);

        $product = Product::with('get_options.get_options')->where('seller',$this->sellerId())->where('id',decrypt($productid))->first();
        if ($product) {
            $optionF = $product->get_options->where('id',decrypt($optionid))->first();
            foreach ($optionF->get_options as $optionfirst ){
                foreach ($request->options as $option){
                    $decId = decrypt($option['id']);
                    if ($optionfirst->id === $decId) {
                        $optionfirst->price = $option['price'];
                        $optionfirst->updated_at = Carbon::now();
                        $optionfirst->update();
                        break;
                    }
                }
            }
        }
    }
    //order control
    function total_new_order() {
        $order = OrderProduct::with('get_product.get_shops.get_locations','get_address.get_address','get_product_option.get_option_details','get_product.get_image')->where('seller',$this->sellerId())->get();
        return response()->json(['data' => OrderProductResource::collection($order)->groupBy('status')]);
//        return $order;
    }
    function total_processing_order() {

    }
    function order_status(Request $request, $id) {
        $request->validate([
            'status' => 'required|integer|min:1|max:5'
        ]);
        $order_product = OrderProduct::where('id',decrypt($id))->where('seller',$this->sellerId())->first();
        if ($order_product) {
            if ($order_product->status + 1 === $request->status) {
                $order_product->status = $request->status;
                $order_product->updated_at = Carbon::now();
                $order_product->update();
                return response('Updated',200);
            } else {
                return response('You can only update next step',411);
            }


        }
    }

}
