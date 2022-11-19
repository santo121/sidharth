import 'package:sidarth_new/Screens/Police_Screens/Fine%20Details/summons_model.dart';
import 'package:http/http.dart' as http;
class SummonsService{

  Future<dynamic> saveSummons(SummonsModel model)async{
    const String uri = "https://penalty.gitdr.com/api/summons";
    final response = await http.post(Uri.parse(uri),body: model.toJson());
    switch(response.statusCode){
      case 200:
      return response.statusCode;

    }
  }
}