import 'package:flutter/material.dart';

class LoginController with ChangeNotifier{
  String? loginUser;
  String? password;

 void changeLogin(val){
  loginUser = val;
    notifyListeners();} 

 void changePassword(val){
  password = val;
    notifyListeners();} 

    Map<String,String?> toJson(){
      return {
        "phone":loginUser,
        "password":password,
      };
    }

}