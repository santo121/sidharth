import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:sidarth_new/urls.dart';

class LCservice{

  Future<dynamic> service ({number})async{
 final response = await http.get(Uri.parse(lcResponse(licenseNumber:number)));

 if(response.statusCode==200){}
 else{}
  } 
}