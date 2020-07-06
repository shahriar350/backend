<template>
    <div class="container">

    </div>
</template>

<script>
    export default {
        mounted() {
            console.log('this is example')
            window.Echo.channel('laravel_database_demo')
                .listen('DemoEvent', (e) => {
                    console.log(e)
                })
        }
    }
</script>
