<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateShopLocationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('shop_locations', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('shop')->index();
            $table->boolean('main_branch')->default(0);
            //for city
            $table->string('block_house')->nullable();
            $table->string('road');
            $table->string('area');
            $table->string('city');
            $table->string('police');
            $table->string('post');
//            for shopping mall
            $table->string('shopping_complex')->nullable();
            $table->string('floor')->nullable();
            $table->string('shop_no')->nullable();

            $table->foreign('shop')->on('shops')->references('id')
                ->onDelete('cascade');
            $table->softDeletes();
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
        Schema::dropIfExists('shop_locations');
    }
}
