<?php

namespace App\Http\Controllers\admin;

use App\Admin;
use App\Http\Controllers\Controller;
use App\Permission;
use App\Role;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    function register(){
        return view('admin.auth.register');
    }
    function login(){
        return view('admin.auth.login');
    }
    function register_now(Request $request){
        $request->validate([
            'name' => 'required',
            'username' => 'required|unique:admins,user_name',
            'identity' => 'required',
            'password' => 'required|required_with:password_confirmation|same:password_confirmation',
            'password_confirmation' => 'required',
        ]);
        $admin = new Admin();
        $admin->name = $request->get('name');
        $admin->user_name = $request->get('username');
        $admin->password = bcrypt($request->get('password'));
        $admin->identity = bcrypt($request->get('identity'));
        if($admin->save()){
            $superRole = Role::where('name','superadministrator')->first();
            $permissions = Permission::all();
            foreach ($permissions as $permission){
                $admin->attachPermission($permission);
            }
            $admin->attachRole($superRole);
        }
        return redirect()->route('admin.login');

    }
    function login_now(Request $request){
        $request->validate([
            'username' => 'required',
            'identity' => 'required',
            'password' => 'required',
        ]);
        if($admin = Admin::where('user_name',$request->username)->first()){
            if (Hash::check($request->get('password'), $admin->password) && Hash::check($request->get('identity'), $admin->identity)){
                Auth::guard('admin')->login($admin,true);
                return redirect()->route('admin.dashboard');
            }
        }
    }
}
