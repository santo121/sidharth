import 'package:sidarth_new/Screens/Police_Screens/Fine%20Details/offense_details_model.dart';
import 'package:http/http.dart' as http;
import 'package:sidarth_new/urls.dart';
class OffenseService{
  Future<dynamic> sendFine(OffenseModel model)async{
    String uri = sendFines;

   final response = await http.post(Uri.parse(uri),body: model.toJson(),);
//! response from the send fine is not finished
   switch(response.statusCode){
    case 200:
    return 200;
    case 401:
    return 401;
   
    
   }
  }
}