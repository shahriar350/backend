<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
    <title>Document</title>
</head>
<body>
    <div class="container d-flex justify-content-center align-content-center" style="height: 100vh">
        <div class="d-flex align-items-center">
            <div class="row shadow-sm">
                <div class="col-12">
                    @if ($errors->any())
                        <div class="alert alert-danger">
                            <ul>
                                @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        </div>
                    @endif
                </div>
                <div class="col-6 border-right p-2 ">
                    <img src="{{ asset('common/image/logo.png') }}" width="100%" alt="">
                </div>
                <div class="col-6 p-4">
                    <form action="{{ route('admin.register.now') }}" method="post" enctype="multipart/form-data">
                        @csrf
                        <div class="form-label-group my-2">
                            <label for="inputName">Name</label>
                            <input type="text" id="inputName" name="name" class="form-control" placeholder="Name" required>
                        </div>
                        <div class="form-label-group my-2">
                            <label for="inputUsername">User name</label>
                            <input type="text" name="username" id="inputUsername" class="form-control" placeholder="Email" required>
                        </div>
                        <div class="form-label-group my-2">
                            <label for="identity">Identity</label>
                            <input type="text" id="identity" name="identity" class="form-control" placeholder="Identity" required>
                        </div>
                        <div class="form-label-group my-2">
                            <label for="inputPassword">Password</label>
                            <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required>
                        </div>
                        <div class="form-label-group my-2">
                            <label for="inputConfPassword">Confirm Password</label>
                            <input type="password" id="inputConfPassword" name="password_confirmation" class="form-control" placeholder="Confirm Password" required>
                        </div>

                        <a href="{{ route('admin.login') }}" class="btn btn-outline-primary float-left btn-inline mb-50">Login</a>
                        <button type="submit" class="btn btn-primary float-right btn-inline mb-50">Register</button>
                    </form>
                </div>
            </div>
        </div>

    </div>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js" integrity="sha384-oesi62hOLfzrys4LxRF63OJCXdXDipiYWBnvTl9Y9/TRlw5xlKIEHpNyvvDShgf/" crossorigin="anonymous"></script>
</body>
</html>
