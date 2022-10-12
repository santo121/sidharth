import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:sidarth_new/Screens/Police_Screens/Police_Transations/fine_paid_details_model.dart';
import 'package:http/http.dart' as http;

import '../../../urls.dart';
class FinePaidDetailsService with ChangeNotifier{
  Future<FineResponse> getFinDetails({required String psId})async{
    String url = regFineList(id: psId);

   final response = await http.get(Uri.parse(url),headers: {'Content-Type': 'application/json',
    'Charset': 'utf-8'});
   json.encode(response.body);
   final data = json.encode(response.body);
   log(jsonDecode(data ));
  
   notifyListeners();
   return FineResponse.fromJson(jsonDecode(response.body));
  
  }
}