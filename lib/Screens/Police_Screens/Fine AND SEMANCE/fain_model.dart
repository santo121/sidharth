class UserFineModelClass {
  List<Data>? data;

  UserFineModelClass({this.data});

  UserFineModelClass.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
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
  int? fineId;
  String? offenseId;
  String? amount;
  int? rcId;
  String? name;
  String? phoneNumber;
  int? stationId;
  String? createdAt;
  String? updatedAt;
  String? address;
  String? village;
  String? street;
  String? status;
  String? mode;

  Data(
      {this.fineId,
      this.offenseId,
      this.amount,
      this.rcId,
      this.name,
      this.phoneNumber,
      this.stationId,
      this.createdAt,
      this.updatedAt,
      this.address,
      this.village,
      this.street,
      this.status,
      this.mode});

  Data.fromJson(Map<String, dynamic> json) {
    fineId = json['fine_id'];
    offenseId = json['offense_id'];
    amount = json['amount'];
    rcId = json['rc_id'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    stationId = json['station_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    address = json['address'];
    village = json['village'];
    street = json['street'];
    status = json['status'];
    mode = json['mode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fine_id'] = this.fineId;
    data['offense_id'] = this.offenseId;
    data['amount'] = this.amount;
    data['rc_id'] = this.rcId;
    data['name'] = this.name;
    data['phone_number'] = this.phoneNumber;
    data['station_id'] = this.stationId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['address'] = this.address;
    data['village'] = this.village;
    data['street'] = this.street;
    data['status'] = this.status;
    data['mode'] = this.mode;
    return data;
  }
}