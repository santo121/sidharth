import 'dart:convert';

import 'package:sidarth_new/Screens/Police_Screens/Fine%20AND%20SEMANCE/fain_model.dart';
import 'package:sidarth_new/urls.dart';
import 'package:http/http.dart' as http;


class UserFineService{

  Future<UserFineModelClass> fineService({required String userId})async{

    String uri = userFineList(id: userId);
    final response = await http.get(Uri.parse(uri));
    switch (response.statusCode){
      case 200 :
      return UserFineModelClass.fromJson(json.decode(response.body)); 
      default:
      return throw response.statusCode;
    }
   
  }
}