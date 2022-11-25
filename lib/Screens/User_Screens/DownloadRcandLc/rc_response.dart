class RCResponse {
  List<Data>? data;
  int? statusCode;
  RCResponse({this.data});
  RCResponse.statusCode(this.statusCode);
  RCResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
  
}


class Data {
  int? rcId;
  String? engineno;
  String? registernumber;
  String? rcStatus;
  String? pollutionvalidupto;
  String? insurancevalidupto;
  String? registrationdate;
  String? taxvalidupto;
  String? createdAt;
  String? updatedAt;
  String? phonenumber;

  Data(
      {this.rcId,
      this.engineno,
      this.registernumber,
      this.rcStatus,
      this.pollutionvalidupto,
      this.insurancevalidupto,
      this.registrationdate,
      this.taxvalidupto,
      this.createdAt,
      this.updatedAt,
      this.phonenumber});

  Data.fromJson(Map<String, dynamic> json) {
    rcId = json['rc_id'];
    engineno = json['engineno'];
    registernumber = json['registernumber'];
    rcStatus = json['rc_status'];
    pollutionvalidupto = json['pollutionvalidupto'];
    insurancevalidupto = json['insurancevalidupto'];
    registrationdate = json['registrationdate'];
    taxvalidupto = json['taxvalidupto'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    phonenumber = json['phonenumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rc_id'] = this.rcId;
    data['engineno'] = this.engineno;
    data['registernumber'] = this.registernumber;
    data['rc_status'] = this.rcStatus;
    data['pollutionvalidupto'] = this.pollutionvalidupto;
    data['insurancevalidupto'] = this.insurancevalidupto;
    data['registrationdate'] = this.registrationdate;
    data['taxvalidupto'] = this.taxvalidupto;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['phonenumber'] = this.phonenumber;
    return data;
  }
}