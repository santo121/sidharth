

class StationSummonsModel {
  List<Data>? data;
  int? statusCode;
  StationSummonsModel({this.data});
  StationSummonsModel.statusCode(status){
  statusCode = status;
}

  StationSummonsModel.fromJson(Map<String, dynamic> json) {
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
  String? engineno;
  String? registernumber;
  String? rcStatus;
  String? pollutionvalidupto;
  String? insurancevalidupto;
  String? registrationdate;
  String? taxvalidupto;
  String? phonenumber;

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
      this.updatedAt,
      this.engineno,
      this.registernumber,
      this.rcStatus,
      this.pollutionvalidupto,
      this.insurancevalidupto,
      this.registrationdate,
      this.taxvalidupto,
      this.phonenumber});

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
    engineno = json['engineno'];
    registernumber = json['registernumber'];
    rcStatus = json['rc_status'];
    pollutionvalidupto = json['pollutionvalidupto'];
    insurancevalidupto = json['insurancevalidupto'];
    registrationdate = json['registrationdate'];
    taxvalidupto = json['taxvalidupto'];
    phonenumber = json['phonenumber'];
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
    data['engineno'] = this.engineno;
    data['registernumber'] = this.registernumber;
    data['rc_status'] = this.rcStatus;
    data['pollutionvalidupto'] = this.pollutionvalidupto;
    data['insurancevalidupto'] = this.insurancevalidupto;
    data['registrationdate'] = this.registrationdate;
    data['taxvalidupto'] = this.taxvalidupto;
    data['phonenumber'] = this.phonenumber;
    return data;
  }
}