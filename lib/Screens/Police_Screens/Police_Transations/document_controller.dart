import 'dart:io';
import 'package:flutter/material.dart';

class DocumentController extends ChangeNotifier{
  late File pickedDocument;
  bool bools=false;
  void changePickedFile(val){
    pickedDocument = val;
  notifyListeners();
  }
  void changeBool(val){
bools=val;
notifyListeners();
  }
}