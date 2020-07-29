<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('url')->nullable();
            $table->string('name');
            $table->float('price');
            $table->unsignedBigInteger('seller');
            $table->longText('description')->nullable();
            $table->boolean('active')->default(0);
            $table->unsignedBigInteger('offerPrice')->default(0);
            $table->string('offerStart')->nullable();
            $table->string('offerEnd')->nullable();
            $table->string('offerType')->nullable();
            $table->tinyInteger('offerMinimumBuy')->nullable();
            $table->foreign('seller')->references('id')->on('sellers')
                ->cascadeOnDelete();
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
        Schema::dropIfExists('products');
    }
}
