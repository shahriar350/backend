<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrderProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('order_products', function (Blueprint $table) {
            $table->id();
            $table->char('url',60)->nullable();
            $table->unsignedBigInteger('order');
            $table->tinyInteger('status')->default(0);
            $table->boolean('complete')->default(0);

            $table->unsignedBigInteger('seller');
            $table->unsignedBigInteger('product');
            $table->unsignedInteger('quantity');
            $table->unsignedInteger('offer')->nullable();
            $table->unsignedFloat('total_price')->nullable();

            $table->foreign('order')->references('id')->on('orders')->cascadeOnDelete();
            $table->foreign('product')->references('id')->on('products')->cascadeOnDelete();
            $table->foreign('seller')->references('id')->on('sellers')->cascadeOnDelete();

            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('order_products');
    }
}
