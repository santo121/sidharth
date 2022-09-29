import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PoliceQrCodeController with ChangeNotifier {
  String? scannerVal;
  void changeScannerVal(val) {
    scannerVal = val;
    notifyListeners();
  }
}
