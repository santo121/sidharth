class FineModel {
  int offenseid;
  int rcid;
  String name;
  int phonenumber;
  int date;
  String mode;
  int stationid;

  FineModel(
      {required this.offenseid,
      required this.rcid,
      required this.name,
      required this.phonenumber,
      required this.date,
      required this.stationid,
      required this.mode});

  Map<String, dynamic> toBody() => {
        "offense_id": offenseid,
        "rc_id": rcid,
        "name": name,
        "phone_number": phonenumber,
        "data": date,
        "mode": mode,
        "station_id": stationid,
      };
}
