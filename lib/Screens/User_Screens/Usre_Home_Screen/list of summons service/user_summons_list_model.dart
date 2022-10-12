class UserSummonsList {
  List<Data>? data;
  int? statusCode;
  UserSummonsList({this.data});

  UserSummonsList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }
  UserSummonsList.statusCode(int status){
    statusCode = status;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? summonsId;
  String? offenseId;
  int? rcId;
  String? name;
  String? phoneNumber;
  String? address;
  String? date;
  String? attachment;
  int? stationId;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.summonsId,
      this.offenseId,
      this.rcId,
      this.name,
      this.phoneNumber,
      this.address,
      this.date,
      this.attachment,
      this.stationId,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    summonsId = json['summons_id'];
    offenseId = json['offense_id'];
    rcId = json['rc_id'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    date = json['date'];
    attachment = json['attachment'];
    stationId = json['station_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['summons_id'] = this.summonsId;
    data['offense_id'] = this.offenseId;
    data['rc_id'] = this.rcId;
    data['name'] = this.name;
    data['phone_number'] = this.phoneNumber;
    data['address'] = this.address;
    data['date'] = this.date;
    data['attachment'] = this.attachment;
    data['station_id'] = this.stationId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}