<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductShopLocationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('product_shop_locations', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('product_shop');
            $table->integer('quantity');
            $table->boolean('stock')->default(0);
            $table->foreign('product_shop')->on('product_shops')->references('id')
                ->cascadeOnDelete();
            $table->unsignedBigInteger('location');
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
        Schema::dropIfExists('product_shop_locations');
    }
}
