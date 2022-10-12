import 'package:flutter/material.dart';



class FineController extends ChangeNotifier {


  String? vehicleNumber;
  String? name;
  String? mobileNumber;
  // List<String>? offense;
  String? amount;
  String? address;
  String? modeOfFine="online";
  List<String> selectedOffense=[];
  bool ?checkBoxVal =false;
  List<String> payMode=["online","offline"];
  void changeCheckBoxVal(val){
    checkBoxVal = val;
    notifyListeners();

  }
  void addSelectedOffense(val){
    selectedOffense.add(val);
  }
  void removeSelectedOffense(val){
    selectedOffense.remove(val);
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

  // void changeOffense(val) {
  //   offense = val;
  //   notifyListeners();
  // }

  void changeAmount(val) {
    amount = val;
    notifyListeners();
  }

  void changeAddress(val) {
    address = val;
    notifyListeners();
  }

  void changeModeOfFine(val) {
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
