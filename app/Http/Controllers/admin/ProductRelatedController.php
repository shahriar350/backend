<?php

namespace App\Http\Controllers\admin;

use App\Category;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class ProductRelatedController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    function category(){
        $categories = Category::all();
        return view('admin.category.category',compact('categories'));
    }
    function category_post(Request $request){
        $request->validate([
            'name' => 'required|string',
            'parent' => 'nullable|numeric'
        ]);
        $category = new Category();
        $category->name = $request->get('name');
        $category->parent = isset($request->parent) ? $request->parent : null ;
        $category->save();
        return back()->withToastSuccess('Removed successfully');
    }
    function category_remove($id){
        $cat = Category::where('id',$id)->first();
        if ($cat){
            if($cat->delete()){
                return back()->withToastSuccess('Removed successfully');
            }
        }
    }
}
