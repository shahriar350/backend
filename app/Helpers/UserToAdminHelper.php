<?php

//if (!function_exists('DummyFunction')) {
//
//    /**
//     * description
//     *
//     * @param
//     * @return
//     */
//    function DummyFunction()
//    {
//
//    }
//}
function getadmin(){
    return auth()->guard('admin')->user();
}
function getadminroles(){
    return auth()->guard('admin')->user()->roles;
}