<ul>
    @foreach($data as $category)

        <li class="font-18">{{ ucfirst($category->name)}}
            @if(count($category->children) > 0)
                @include('admin.category.child_node',['data' => $category->children])
            @endif
        </li>



    @endforeach
</ul>

