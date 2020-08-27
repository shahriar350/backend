<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUserAddressesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('user_addresses', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user');
            $table->string('house')->nullable();
            $table->string('area')->nullable();
            $table->string('road')->nullable();
            $table->string('police')->nullable();
            $table->string('post')->nullable();
            $table->string('city')->nullable();
            $table->boolean('default')->default(0);
            $table->foreign('user')->on('users')->references('id')
                ->cascadeOnDelete();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('user_addresses');
    }
}
