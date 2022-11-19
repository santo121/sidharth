

import 'package:flutter/material.dart';

class SummonsController extends ChangeNotifier{

String name='';
String vehicleNumber='';
String mobileNumber='';
String address = '';
List<String>summonsOffense=[];
// String 
void changeName(val){
  name=val;
    notifyListeners();
}

void changeAddress(String val){
  address = val;
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