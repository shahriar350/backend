<?php

function getadmin(){
    return auth()->guard('admin')->user();
}
function getadminroles(){
    return auth()->guard('admin')->user()->roles;
}
