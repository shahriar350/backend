<template>
    <div class="col-12 card p-2 rounded">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>Id</th>
                <th>Shop Name</th>
                <th>Shop Author</th>
                <th>Contact</th>
                <th>Location</th>
                <th>User</th>
                <th>Created_at</th>
                <th>Active</th>
            </tr>
            </thead>

            <tbody>
            <tr v-for="(req ,index) in seller_requests">
                <td>{{ index + 1}}</td>
                <td>
                    {{ req.comapny_name }} <br/>
                </td>
                <td>
                    {{ req.comapny_author }} <br/>
                </td>
                <td>{{ req.contact }}</td>
                <td>
                    {{ req.location }} <br/>
                </td>
                <td class="text-primary cursor-pointer" @click="openUserDetails(req.user)">
                    {{ req.user.name }}
                </td>
                <td>{{ req.created_at }}</td>
                <td @click="activeSeller(req.id,index)" class="cursor-pointer">
                    <i class="bx bx-plus-circle bx-sm"></i>
                </td>
            </tr>
            </tbody>
        </table>
        <a-modal :footer="null" :visible="user_show" title="User show" @cancel="handleCancel">
            <div class="card card-body">
                <h3>{{ req_user.name }}</h3>
                <p>{{ req_user.email }}</p>
                <p>{{ req_user.created_at }}</p>
                <p>{{ req_user.updated_at }}</p>
            </div>
        </a-modal>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                seller_requests: [],
                user_show: false,
                req_user: '',
            }
        },
        mounted() {
            window.Echo.channel('admin')
                .listen('SellerRequestEvent', (e) => {
                    this.seller_requests.unshift(e.info)
                })
        },
        created() {
            this.getallrequest()
        },
        methods: {
            activeSeller(id,index){
                if (confirm('Do you want to active')){
                    axios.post('/bongopanel/api/seller/active',{
                        id: id
                    })
                        .then(res => {
                            this.$notification.success({
                                message: 'you have successfully active shop'
                            })
                            this.seller_requests.splice(index,1)
                        })
                }

            },
            openUserDetails(user){
                this.req_user = user;
                this.user_show = true
            },
            getallrequest() {
                axios.get('/bongopanel/api/seller/request')
                    .then(res => {
                        this.seller_requests = res.data.data;
                    })
            },
            handleCancel(){
                this.user_show =false
            }
        },
    }
</script>

<style scoped>
    .cursor-pointer{
        cursor: pointer;
    }
</style>