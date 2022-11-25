import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sidarth_new/Functions/storage.dart';
import 'package:sidarth_new/Screens/User_Screens/DownloadRcandLc/rc_response.dart';
import 'package:sidarth_new/urls.dart';

class RCService {
  Future<RCResponse> service(
      {required String? enginNum,
      required String? registrationNum,
      context}) async {
    final response = await http.get(Uri.parse(rcResponse(
        engineNum: enginNum.toString(),
        registrationNum: registrationNum.toString())));

    if (response.statusCode == 200) {

    
      return RCResponse.fromJson(json.decode(response.body));
    } else {
      return RCResponse.statusCode(response.statusCode);
    }
  }
}
