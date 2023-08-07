<?php

namespace App\Http\Controllers;


use App\Http\Controllers\BaseController;
use App\Http\Resources\ToArray;


use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class UserController extends BaseController
{
    public function login(Request $request){
        $user=User::where('email',$request->email)->first();
        if(!$user || !Hash::check($request->password,$user->password)){
            return $this->sendError('Password or email is wrong.');
        }
        $user->tokens()->delete();
        $token=$user->createToken('user-api-token',['user:token'])->plainTextToken;
        $response=[
            "success"=> true,
            'data'=> new ToArray($user),
            'token'=> $token,
            "message"=>  "Login success"
        ];
        return response($response);
    }
    public  function  register(Request $request){
        $userById=User::where('email',$request->email)->first();
        if($userById){
            return $this->sendError('This email is being used by another user');
        }
        $user = User::create($request->all());
        return $this->sendResponse(new ToArray($user),'User added successfully');
    }
    public  function  getUsers(){
        $users = User::all();
        return $this->sendResponse(ToArray::collection($users),'');
    }
    public  function  getUsersById($id){
        $user = User::find($id);
        return $this->sendResponse(new ToArray($user),'');
    }
    public  function  updateUser(Request $request){
        $user = User::find($request->user_id);
        $user->update($request->all());
        return $this->sendResponse(new ToArray($user),'User updated successfully');
    }
}
