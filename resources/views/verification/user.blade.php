<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title></title>
</head>
<body>

<div style="height: 40vw;">
    <img src="{{ asset('common/image/logo.png') }}" alt="bongobitan" width="40px">
</div>
<h4 style="text-align: center; width: 100%">Hello {{ $user->name }}</h4>
<p style="text-align: center; width: 100%">Welcome to Bongobitan. You can buy anything from Bongobitan</p>
<p style="text-align: center; width: 100%">Active your account by clicking this</p>
<p style="text-align: center; width: 100%">
    {{--    <a href="{{ route('apiuser.verify',$user->email_verification)  }}">Click to active</a>--}}
    <a href="http://127.0.0.1:3000/verify/user/{{encrypt($user->email_verify_code)}}">Click to active</a>
    OR <br/>
    <span>
        http://127.0.0.1:3000/user/verify/{{encrypt($user->email_verify_code)}}
    </span>
</p>

</body>
</html>