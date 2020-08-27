<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductReviewsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('product_reviews', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('product');
            $table->foreign('product')->on('products')->references('id')->cascadeOnDelete();

            $table->unsignedBigInteger('user')->index();


            $table->unsignedBigInteger('order_product');
            $table->foreign('order_product')->on('order_products')->references('id')->cascadeOnDelete();

            $table->tinyInteger('rating');
            $table->char('description',120)->nullable();
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
        Schema::dropIfExists('product_reviews');
    }
}
