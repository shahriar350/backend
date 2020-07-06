<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSellerRequestsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('seller_requests', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user');
            $table->string('company_name');
            $table->string('company_author');
            $table->string('contact');
            $table->string('location');
            $table->boolean('verified')->default(0);
            $table->unsignedBigInteger('verified_by')->nullable();
            $table->foreign('user')->on('users')->references('id')
                ->onDelete('cascade');
            $table->foreign('verified_by')->on('admins')->references('id')
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
        Schema::dropIfExists('seller_requests');
    }
}
