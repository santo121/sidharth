import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sidarth_new/Screens/LoginScreens/addmin_login_Screen/policestation_login_responsemodel.dart';
import 'package:sidarth_new/urls.dart';

class LogoInService{
  Future<PoliceStationLoginResponse> callLoginService(myModel)async{
    String uri = policeStationLoginUrl;
  final response = await http.post(Uri.parse(uri),body: myModel);
print(response.statusCode);
  if(response.statusCode==200){
    print(response.body);
    // return PoliceStationLoginResponse.fromJson(response.statusCode);
    
return PoliceStationLoginResponse.fromJson(json.decode(response.body));  
  }
  else{
    return PoliceStationLoginResponse.statusCode(response.statusCode);
  }
  }}

// LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

// String loginModelToJson(LoginModel data) => json.encode(data.toJson());

// class LoginModel {
//     LoginModel({
//         this.uId,
//         this.phoneNumber,
//         this.userName,
//         this.updatedAt,
//         this.createdAt,
//         this.id,
//         this.message,
//     });

//     int? uId;
//     String? phoneNumber;
//     String? userName;
//     DateTime? updatedAt;
//     DateTime? createdAt;
//     int? id;
//     String? message;

//     factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
//         uId: json["u_id"],
//         phoneNumber: json["phone_number"],
//         userName: json["user_name"],
//         updatedAt: DateTime.parse(json["updated_at"]),
//         createdAt: DateTime.parse(json["created_at"]),
//         id: json["id"],
//         message: json["message"],
//     );

//     Map<String, dynamic> toJson() => {
//         "u_id": uId,
//         "phone_number": phoneNumber,
//         "user_name": userName,
//         "updated_at": updatedAt!.toIso8601String(),
//         "created_at": createdAt!.toIso8601String(),
//         "id": id,
//         "message": message,
//     };
// }
