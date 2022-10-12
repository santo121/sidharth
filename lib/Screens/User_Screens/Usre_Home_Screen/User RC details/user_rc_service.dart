import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sidarth_new/Screens/User_Screens/Usre_Home_Screen/User%20RC%20details/user_rc_model.dart';
import 'package:sidarth_new/urls.dart';

class UserRcDetailsService{


  Future<UserRcDetails>getRCDetails(SendPhoneForRc sendModel)async{
    final response = await http.post(Uri.parse(userRcDetailsApi),body:sendModel.toJson());
    switch (response.statusCode){
      case 200:
      return UserRcDetails.fromJson(json.decode(response.body));
      default:
      return UserRcDetails.rcStatusCode(statusCode: response.statusCode);
    }


  }
}