<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCartProductOptionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cart_product_options', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('cart_product');
            $table->unsignedBigInteger('option_parent');
            $table->unsignedBigInteger('option');
            $table->foreign('cart_product')->on('cart_products')->references('id')
                ->cascadeOnDelete();
            $table->foreign('option')->on('product_option_details')->references('id')
                ->cascadeOnDelete();
            $table->foreign('option_parent')->on('product_options')->references('id')
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
        Schema::dropIfExists('cart_product_options');
    }
}
