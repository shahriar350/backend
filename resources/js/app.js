/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');
require('./bootstrap');
Vue.prototype.$userId = document.querySelector("meta[name='user-id']").getAttribute('content');

//integrate

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))

Vue.component('example-component', require('./components/ExampleComponent.vue').default);
Vue.component('index', require('./components/index.vue').default);
Vue.component('navbar', require('./components/nav.vue').default);
Vue.component('seller_req', require('./components/seller_request.vue').default);
Vue.component('category', require('./components/category/index.vue').default);

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */
//ant design start
import 'ant-design-vue/dist/antd.css'
import  {message}  from 'ant-design-vue';
import {Modal}   from 'ant-design-vue';
import {Checkbox}   from 'ant-design-vue';
import {Empty}   from 'ant-design-vue';
import {Menu}   from 'ant-design-vue';
import {Icon}   from 'ant-design-vue';
import  {notification}  from 'ant-design-vue';

Vue.prototype.$message = message;
Vue.prototype.$notification = notification;

Vue.use(Modal);
Vue.use(Checkbox);
Vue.use(Empty);
Vue.use(Menu);
Vue.use(Icon);
//ant design end

const app = new Vue({
    el: '#app',
});
