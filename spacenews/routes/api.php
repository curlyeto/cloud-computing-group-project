<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\FavoriteController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/
Route::group(['middleware' => 'auth:sanctum'], function ($router) {

    Route::get('user',[UserController::class,'getUsers']);
    Route::get('user/{id}',[UserController::class,'getUsersById']);
    Route::post('user',[UserController::class,'updateUser']);
    Route::get('favorite/{id}',[FavoriteController::class,'getFavourite']);
    Route::post('favorite',[FavoriteController::class,'addFavorite']);
    Route::post('favorite/delete',[FavoriteController::class,'deleteFavorite']);
});
Route::post('user/login',[UserController::class,'login']);
Route::post('user/register',[UserController::class,'register']);
