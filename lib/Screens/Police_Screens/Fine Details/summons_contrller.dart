

import 'package:flutter/material.dart';

class SummonsController extends ChangeNotifier{

String name='';
String vehicleNumber='';
String mobileNumber='';
List<String>summonsOffense=[];
// String 
void changeName(val){
  name=val;
    notifyListeners();
}
void changeVehicleNumber(val){
  vehicleNumber=val;
    notifyListeners();
}

void changeMobileNumber(val){
    mobileNumber=val;
    notifyListeners();
}
void changeSummonsOffense(val){
  summonsOffense=val;
  notifyListeners();
}
}