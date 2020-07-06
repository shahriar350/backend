<div class="h-100" id="left-side-menu-container" data-simplebar>

    <!--- Sidemenu -->
    <ul class="metismenu side-nav">

        <li class="side-nav-title side-nav-item">Navigation</li>

        <li class="side-nav-item {{ (request()->is('bongopanel')) ? 'mm-active' : '' }}">
            <a href="{{ route('admin.dashboard') }}" class="side-nav-link">
                <i class="bx bx-phone-incoming"></i>
                <span> Dashboard </span>
            </a>
        </li>

        <li class="side-nav-title side-nav-item">Seller</li>

        <li class="side-nav-item" {{ request()->is('bongopanel/seller/request') ? 'mm-active' : '' }}>
            <a href="{{ route('admin.seller.request') }}" class="side-nav-link">
                <i class="bx bx-phone-incoming"></i>
                <span> Request </span>
            </a>
        </li>

        <li class="side-nav-title side-nav-item mt-1">Product related</li>
        <li class="side-nav-item" {{ request()->is('bongopanel/category') ? 'mm-active' : '' }}>
            <a href="{{ route('admin.category') }}" class="side-nav-link">
                <i class="bx bx-list-ol"></i>
                <span> Category </span>
            </a>
        </li>




    </ul>

    <!-- end Help Box -->
    <!-- End Sidebar -->

    <div class="clearfix"></div>

</div>

{{--<li class="side-nav-item">--}}
{{--    <a href="javascript: void(0);" class="side-nav-link">--}}
{{--        <i class="uil-folder-plus"></i>--}}
{{--        <span> Multi Level </span>--}}
{{--        <span class="menu-arrow"></span>--}}
{{--    </a>--}}
{{--    <ul class="side-nav-second-level" aria-expanded="false">--}}
{{--        <li class="side-nav-item">--}}
{{--            <a href="javascript: void(0);" aria-expanded="false">Second Level--}}
{{--                <span class="menu-arrow"></span>--}}
{{--            </a>--}}
{{--            <ul class="side-nav-third-level" aria-expanded="false">--}}
{{--                <li>--}}
{{--                    <a href="javascript: void(0);">Item 1</a>--}}
{{--                </li>--}}
{{--                <li>--}}
{{--                    <a href="javascript: void(0);">Item 2</a>--}}
{{--                </li>--}}
{{--            </ul>--}}
{{--        </li>--}}
{{--        <li class="side-nav-item">--}}
{{--            <a href="javascript: void(0);" aria-expanded="false">Third Level--}}
{{--                <span class="menu-arrow"></span>--}}
{{--            </a>--}}
{{--            <ul class="side-nav-third-level" aria-expanded="false">--}}
{{--                <li>--}}
{{--                    <a href="javascript: void(0);">Item 1</a>--}}
{{--                </li>--}}
{{--                <li class="side-nav-item">--}}
{{--                    <a href="javascript: void(0);" aria-expanded="false">Item 2--}}
{{--                        <span class="menu-arrow"></span>--}}
{{--                    </a>--}}
{{--                    <ul class="side-nav-forth-level" aria-expanded="false">--}}
{{--                        <li>--}}
{{--                            <a href="javascript: void(0);">Item 2.1</a>--}}
{{--                        </li>--}}
{{--                        <li>--}}
{{--                            <a href="javascript: void(0);">Item 2.2</a>--}}
{{--                        </li>--}}
{{--                    </ul>--}}
{{--                </li>--}}
{{--            </ul>--}}
{{--        </li>--}}
{{--    </ul>--}}
{{--</li>--}}
