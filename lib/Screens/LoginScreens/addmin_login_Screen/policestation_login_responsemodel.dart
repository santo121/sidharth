class PoliceStationLoginResponse {
  String? token;
  int? userId;
  Data? data;
  String? message;
  int? statusCode;
  PoliceStationLoginResponse(
      {this.token, this.userId, this.data, this.message});

  PoliceStationLoginResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userId = json['user_id'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }
  PoliceStationLoginResponse.statusCode(statusCodes){
   statusCode=statusCodes;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['user_id'] = this.userId;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? sId;
  int? lId;
  String? contactNo;
  String? place;
  String? siName;
  String? stationName;
  String? district;
  int? pin;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.sId,
      this.lId,
      this.contactNo,
      this.place,
      this.siName,
      this.stationName,
      this.district,
      this.pin,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['s_id'];
    lId = json['l_id'];
    contactNo = json['contact_no'];
    place = json['place'];
    siName = json['si_name'];
    stationName = json['station_name'];
    district = json['district'];
    pin = json['pin'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['s_id'] = this.sId;
    data['l_id'] = this.lId;
    data['contact_no'] = this.contactNo;
    data['place'] = this.place;
    data['si_name'] = this.siName;
    data['station_name'] = this.stationName;
    data['district'] = this.district;
    data['pin'] = this.pin;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}