import 'dart:developer';

import 'package:flutter/material.dart';

class FineIndex{
  String offense;
  int index;
  FineIndex({required this.index,required this.offense});
}

class FineController extends ChangeNotifier {
  String? vehicleNumber;
  String? name;
  String? mobileNumber;
  // List<String>? offense;
  String? amount;
  String? address;
  String? modeOfFine;
  List<FineIndex> selectedOffense=[];
  
  bool ?checkBoxVal =false;
  List<String> payMode=["online","offline"];
  void changeCheckBoxVal(val){
    checkBoxVal = val;
    log("data${selectedOffense.length}");

    notifyListeners();

  }
  void addSelectedOffense(FineIndex val){
    selectedOffense.add(val);
    notifyListeners();
  }
  void removeSelectedOffense(FineIndex val){
    selectedOffense.remove(val);
    log("data${selectedOffense.length}");
    notifyListeners();
  }
  void changeVehicleNumber(val) {
    vehicleNumber = val;
    notifyListeners();
  }

  void changeName(val) {
    name = val;
    notifyListeners();
  }

  void changeMobileNumber(val) {
    mobileNumber = val;
    notifyListeners();
  }

  void changeAmount(val) {
    amount = val;
    notifyListeners();
  }

  void changeAddress(val) {
    address = val;
    notifyListeners();
  }

  void changeModeOfFine(String val) {
    modeOfFine = val;
    notifyListeners();
  }

  Map<String, dynamic> toJson() {
    return {
      "vehicle_number": vehicleNumber,
      "name": name,
      "mobile_number": mobileNumber,
      "offense": selectedOffense.toString(),
      "amount": amount,
      "address": address,
      "modeOfFine": modeOfFine
    };
  }
}
