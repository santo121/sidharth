import 'package:flutter/material.dart';

class FineController extends ChangeNotifier {
  String? vehicleNumber;
  String? name;
  String? mobileNumber;
  List<String>? offense;
  String? amount;
  String? address;
  String? modeOfFine;

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

  void changeOffense(val) {
    offense = val;
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

  void changeModeOfFine(val) {
    vehicleNumber = val;
    notifyListeners();
  }

  Map<String, dynamic> toJson() {
    return {
      "vehicle_number": vehicleNumber,
      "name": name,
      "mobile_number": mobileNumber,
      "offense": offense.toString(),
      "amount": amount,
      "address": address,
      "modeOfFine": modeOfFine
    };
  }
}
