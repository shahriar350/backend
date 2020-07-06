@extends('admin.master')

@section('title','category section')

@section('breadcrumb')
    <div class="page-title-box">
        <div class="page-title-right">
            <ol class="breadcrumb m-0">
                <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Home</a></li>
                <li class="breadcrumb-item active">Category</li>
            </ol>
        </div>
        <h4 class="page-title">Category</h4>
    </div>
@endsection

@section('body')
    <div class="col-12">
        @include('flash::message')
    </div>
    <div class="row">
        <div class="col-md-6 card rounded">
            <ul>
                @foreach($categories as $category)
                    @if($category->parent === null)
                        <li class="font-20 d-inline-block">{{ ucfirst($category->name) }}</li>
                        <form class="d-inline-block" action="{{ route('admin.category.remove',$category->id) }}" method="POST">
                            @csrf
                            @method('DELETE')
                            <button type="submit" style="background: no-repeat;border: none;"><i class="bx bx-trash mx-3 text-danger"></i></button>
                        </form>
                        @if(count($category->children) > 0)
                            @include('admin.category.child_node',['data' => $category->children])
                        @endif
                    @endif
                @endforeach
            </ul>


        </div>
        <div class="col-md-6 card rounded">
            <form action="{{ route('admin.category.post') }}" method="post">
                @csrf
                <div class="form-group">
                    <label for="name">Category name</label>
                    <input type="text" name="name" id="name" class="form-control">
                </div>
                <div class="form-group">
                    <label for="parent">Parent</label>
                    <select name="parent" id="parent" class="form-control">
                        <option value="">Root</option>
                        @foreach($categories as $category)
                            <option value="{{$category->id}}">{{ $category->name }}</option>
                        @endforeach
                    </select>
                </div>
                <div>
                    <button class="btn btn-primary w-100" type="submit">Add now</button>
                </div>
            </form>
        </div>
    </div>
@endsection
