import 'package:flutter/material.dart';

class UserVehicleNumberController with ChangeNotifier{
  
  List<RcIdGettingModel> rcModelList=[];
  
  
  void addUserVehicles(RcIdGettingModel val){
    rcModelList.add(val);
     notifyListeners();
  }
  
}

class RcIdGettingModel{
String userVehicleNumber;
String rcId;

RcIdGettingModel({required this.rcId,required this.userVehicleNumber});

}