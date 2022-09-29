import 'package:flutter/cupertino.dart';

class PoliceProfileControl with ChangeNotifier{
  String? stationAdd;
  String? pinNumber;
  String? phoneNumber;
  String? name;


  void changeStationAdd(val){
    stationAdd=val;
    notifyListeners();
  }
  void changePinNumber(val){
    pinNumber=val;
    notifyListeners();
  }
  void changePhoneNumber(val){
    phoneNumber=val;
    notifyListeners();
  }
  void changeName(val){
    name=val;
    notifyListeners();
  }

  Map<String?,String?> toJson(){
  return {
    "station_address":stationAdd,
    "pin_number":pinNumber,
    "phone_number":phoneNumber,
    "name":name,
  
  };
}
}