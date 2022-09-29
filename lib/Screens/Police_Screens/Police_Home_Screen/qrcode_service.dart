import 'dart:convert';

import 'package:http/http.dart' as http;

class QrCodeService {
  Future<QrCodeModel> qrCodeScannerService({required String url}) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return QrCodeModel.fromJson(json.decode(response.body));
    } else {
      return throw Exception(response.statusCode);
    }
  }
}

// To parse this JSON data, do
//
//     final qrCodeModel = qrCodeModelFromJson(jsonString);

QrCodeModel qrCodeModelFromJson(String str) =>
    QrCodeModel.fromJson(json.decode(str));

String qrCodeModelToJson(QrCodeModel data) => json.encode(data.toJson());

class QrCodeModel {
  QrCodeModel({
    this.data,
  });

  List<Datum>? data;

  factory QrCodeModel.fromJson(Map<String, dynamic> json) => QrCodeModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.rcId,
    this.engineno,
    this.registernumber,
    this.rcStatus,
    this.pollutionvalidupto,
    this.insurancevalidupto,
    this.registrationdate,
    this.taxvalidupto,
    this.createdAt,
    this.updatedAt,
    this.phonenumber,
  });

  int? rcId;
  String? engineno;
  String? registernumber;
  String? rcStatus;
  DateTime? pollutionvalidupto;
  DateTime? insurancevalidupto;
  DateTime? registrationdate;
  DateTime? taxvalidupto;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? phonenumber;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        rcId: json["rc_id"],
        engineno: json["engineno"],
        registernumber: json["registernumber"],
        rcStatus: json["rc_status"],
        pollutionvalidupto: DateTime.parse(json["pollutionvalidupto"]),
        insurancevalidupto: DateTime.parse(json["insurancevalidupto"]),
        registrationdate: DateTime.parse(json["registrationdate"]),
        taxvalidupto: DateTime.parse(json["taxvalidupto"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        phonenumber: json["phonenumber"],
      );

  Map<String, dynamic> toJson() => {
        "rc_id": rcId,
        "engineno": engineno,
        "registernumber": registernumber,
        "rc_status": rcStatus,
        "pollutionvalidupto":
            "${pollutionvalidupto!.year.toString().padLeft(4, '0')}-${pollutionvalidupto!.month.toString().padLeft(2, '0')}-${pollutionvalidupto!.day.toString().padLeft(2, '0')}",
        "insurancevalidupto":
            "${insurancevalidupto!.year.toString().padLeft(4, '0')}-${insurancevalidupto!.month.toString().padLeft(2, '0')}-${insurancevalidupto!.day.toString().padLeft(2, '0')}",
        "registrationdate":
            "${registrationdate!.year.toString().padLeft(4, '0')}-${registrationdate!.month.toString().padLeft(2, '0')}-${registrationdate!.day.toString().padLeft(2, '0')}",
        "taxvalidupto":
            "${taxvalidupto!.year.toString().padLeft(4, '0')}-${taxvalidupto!.month.toString().padLeft(2, '0')}-${taxvalidupto!.day.toString().padLeft(2, '0')}",
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "phonenumber": phonenumber,
      };
}
