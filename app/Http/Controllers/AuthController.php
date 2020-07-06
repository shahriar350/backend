<?php

namespace App\Http\Controllers;

use App\Mail\UserVerificationMail;
use App\Role;
use App\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;

class AuthController extends Controller
{
    function register(Request $request){
        $request->validate([
            'name' => 'required|string',
            'email' => 'required|email|unique:users,email',
            'password' => 'required'
        ]);
        $user = new User();
        $user->name = $request->get('name');
        $user->email = $request->get('email');
        $user->password = bcrypt($request->get('password'));
        $user->email_verify_code = Str::random(12);
        if ($user->save()){
            $role = Role::where('name','user')->first();
            $user->attachRole($role);
            Mail::to($user->email)->queue(new UserVerificationMail($user));
            return response('A notification has sent to your email. Please check it out and active your email',200);
        }
//        try {
//
//
//        } catch (\Exception $exception){
//            return response('Something error',500);
//        }

    }
    function login(Request $request){
//        return $request->all();
        $email = $request->get('email');
        $password = $request->get('password');
//        return $email;
        if (Auth::attempt([
            'email' => $email,
            'password' => $password
        ])) {
            return response()->json('', 204 );
        }else{
            return response()->json([
                'message' => 'Invalid credentials'
            ], 422);
        }
    }

    function verify(Request $request, $id){
        $id = decrypt($id);
        if($user = User::where('email_verify_code',$id)->whereNull('email_verified_at')->first()){
            $user->email_verified_at = Carbon::now();
            if ($user->update()){
                return response('Successfully  verify your email',200);
            }
        }
    }

}
