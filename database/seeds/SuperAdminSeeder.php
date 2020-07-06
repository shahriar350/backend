<?php

use Illuminate\Database\Seeder;

class SuperAdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $superRole = \App\Role::where('name','superadministrator')->first();
        $id = \Illuminate\Support\Facades\DB::table('admins')->insertGetId([
            'name' => 'Saifullah Shaheen',
            'user_name' => 'saif350',
            'password' => bcrypt('123456'),
            'identify' => bcrypt('shahriar350'),
            'created_at' => \Carbon\Carbon::now(),
            'updated_at' => \Carbon\Carbon::now()
        ]);
        $user = \App\Admin::findOrFail($id);
        $permissions = App\Permission::all();
        foreach ($permissions as $permission){
            $user->attachPermission($permission);
        }
        $user->attachRole($superRole);
        $admin = \Illuminate\Support\Facades\DB::table('admin_infos')->insert([
            'admin' => $user->id,
            'created_at' => \Carbon\Carbon::now(),
            'updated_at' => \Carbon\Carbon::now()
        ]);
    }
}
