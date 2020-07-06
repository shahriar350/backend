<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductImagesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('product_images', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('product')->index();
            $table->string('name')->nullable();
            $table->string('video')->nullable();
            $table->unsignedBigInteger('option')->nullable()->index();
            $table->boolean('active')->default(1);
            $table->foreign('product')->on('products')->references('id')
                ->onDelete('cascade');
            $table->foreign('option')->on('product_options')->references('id')
                ->onDelete('cascade');
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
        Schema::dropIfExists('product_images');
    }
}
