import 'dart:convert';

import 'package:sidarth_new/Screens/Police_Screens/Poice_Summons/police_summons_model.dart';
import 'package:sidarth_new/urls.dart';
import 'package:http/http.dart' as http;
class GetPoliceSummonsList{
  Future<StationSummonsModel> getPoliceSummonsList()async{
    
String uri = policeSummonsApi(id: '1');
final response = await http.get(Uri.parse(uri));

  switch(response.statusCode){
    case 200:
    return StationSummonsModel.fromJson(json.decode(response.body));
    default : 
    return StationSummonsModel.statusCode(response.statusCode);
  }

  }
}