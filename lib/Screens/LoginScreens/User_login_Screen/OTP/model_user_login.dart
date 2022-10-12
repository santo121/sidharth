class UserLogin{
  String phone;
  String passWord;
  UserLogin({required this.passWord,required this.phone});

  Map<String,String> toJson(){
    return{
      "phone":phone,
      "password":passWord
    };  }
}
class UserLoginResponseModel {
  int? id;
  int? uId;
  String? userName;
  Null? houseName;
  Null? district;
  Null? pinNumber;
  String? phoneNumber;
  String? createdAt;
  String? updatedAt;
  String? message;

  UserLoginResponseModel(
      {this.id,
      this.uId,
      this.userName,
      this.houseName,
      this.district,
      this.pinNumber,
      this.phoneNumber,
      this.createdAt,
      this.updatedAt,
      this.message});

  UserLoginResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uId = json['u_id'];
    userName = json['user_name'];
    houseName = json['house_name'];
    district = json['district'];
    pinNumber = json['pin_number'];
    phoneNumber = json['phone_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['u_id'] = this.uId;
    data['user_name'] = this.userName;
    data['house_name'] = this.houseName;
    data['district'] = this.district;
    data['pin_number'] = this.pinNumber;
    data['phone_number'] = this.phoneNumber;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['message'] = this.message;
    return data;
  }
}