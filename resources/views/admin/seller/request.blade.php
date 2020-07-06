@extends('admin.master')
@section('title','Seller request')

@section('breadcrumb')
    <div class="page-title-box">
        <div class="page-title-right">
            <ol class="breadcrumb m-0">
                <li class="breadcrumb-item"><a href="javascript: void(0);">Hyper</a></li>
                <li class="breadcrumb-item"><a href="javascript: void(0);">Pages</a></li>
                <li class="breadcrumb-item active">Starter</li>
            </ol>
        </div>
        <h4 class="page-title">Seller Request</h4>
    </div>
@endsection

@section('body')
<div class="row">
    <seller_req></seller_req>
</div>
@endsection