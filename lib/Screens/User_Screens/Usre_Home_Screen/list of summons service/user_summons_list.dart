import 'dart:convert';

import'package:http/http.dart' as http;
import 'package:sidarth_new/Screens/User_Screens/Usre_Home_Screen/list%20of%20summons%20service/user_summons_list_model.dart';
import 'package:sidarth_new/urls.dart';

class UserSummonsListService{
  Future<UserSummonsList> getUserSummonsList(String userId)async{

String uri = userSummonsList(id:userId );
final response = await http.get(Uri.parse(uri));
    switch (response.statusCode){
      case 200:
      return UserSummonsList.fromJson(json.decode(response.body));
      default:
      return UserSummonsList.statusCode(response.statusCode);
    }
  }
}