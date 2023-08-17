<?php

namespace App\Http\Controllers;

use App\Http\Resources\ToArray;
use App\Models\Favorite;
use App\Models\User;
use Illuminate\Http\Request;

class FavoriteController extends BaseController
{
    public  function  addFavorite(Request $request){
        $user = User::find($request->user_id);
        if($user){
            $favoriteByUSer=Favorite::where('user_id',$request->user_id)->where('news_id',$request->news_id)->first();
            if($favoriteByUSer){
                return $this->sendError('That news already added');
            }
            $favorite = Favorite::create($request->all());
            return $this->sendResponse(new ToArray($favorite),'News added to favourite list successfully');
        }else{
            $this->sendError('User invalid in the our system');
        }

    }
    public function getFavourite($id){
        $favorites=Favorite::where('user_id',$id)->get();
        return $this->sendResponse(new ToArray($favorites),'');
    }
    public  function  deleteFavorite(Request $request){
        $favorite=Favorite::where('user_id',$request->user_id)->where('news_id',$request->news_id)->first();
        if($favorite){
               $favorite->delete();
               return $this->sendResponse([],'News deleted from favourite list successfully');
        }else{
            return $this->sendError('This news could not be found');
        }
    }

}
