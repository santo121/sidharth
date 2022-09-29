import 'package:flutter/material.dart';

class EditUserProfile extends ChangeNotifier{
  String? userName;
  String? houseName;
  String? district;
  String? pin;
  String? phoneNumber; 

  // EditUserProfile({ this.district,this.houseName,this.phoneNumber,this.pin,this.userName});
  void addUserName(userName){
    this.userName = userName;
   notifyListeners();
  }
  void addHouseName(houseName){
    this.houseName = houseName;
   notifyListeners();
  }
  void addDistrict(district){
    this.district = district;
   notifyListeners();
  }
  void addPin(pin){
    this.pin = pin;
   notifyListeners();
  }
  void addPoneNumber(phoneNumber){
    this.phoneNumber =phoneNumber ;
   notifyListeners();
  }

Map<String?,String?> toJson(){
  return {
    "user_name":userName,
    "house_name":houseName,
    "district":district,
    "pin_number":pin.toString(),
    "phone_number":phoneNumber.toString()
  };
}

}