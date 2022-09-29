import 'dart:convert' as convert;

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/fine_model.dart';

class FineService {
  String uri = "http://192.168.1.79:8001/api/fine";

  Future serviceCall(FineModel val) async {
    final response = await http.post(Uri.parse(uri), body: val.toBody());
    debugPrint(response.toString());
  }
}
