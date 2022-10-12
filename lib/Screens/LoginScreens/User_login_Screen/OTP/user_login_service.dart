
import 'package:sidarth_new/Screens/LoginScreens/User_login_Screen/OTP/model_user_login.dart';
import 'package:sidarth_new/urls.dart';
import 'package:http/http.dart' as http;
class UserLoginService {

  Future<dynamic> loginService(UserLogin data)async{

    String uri = userLogin;

final response = await http.post(Uri.parse(uri),body: data.toJson());
return response.statusCode;
// print(response.body);

  }
}