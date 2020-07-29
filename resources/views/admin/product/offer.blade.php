@extends('admin.master')

@section('title','Offer')

@section('breadcrumb')
    <div class="page-title-box">
        <div class="page-title-right">
            <ol class="breadcrumb m-0">
                <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
                <li class="breadcrumb-item active">Offer</li>
            </ol>
        </div>
        <h4 class="page-title">Product Offer</h4>
    </div>
@endsection

@section('body')
    <div class="col-12">
        @include('flash::message')
    </div>
    <div class="row">
        <div class="col-md-6 card rounded">

        </div>
        <div class="col-6 card rounded">
            <p class="font-weight-bold">Create a offer</p>
            <form action="">
                <div class="form-group">
                    <label for="name">Offer name</label>
                    <input type="text" class="form-control" id="name" name="offer_name">
                </div>
                <div class="form-group">
                    <button class="w-100 btn btn-rounded btn-primary">Add now</button>
                </div>
            </form>
        </div>
    </div>
@endsection
