
class SummonsModel {
  String vehicleNumber, name, mobileNumber, offense;
  SummonsModel(
      {required this.mobileNumber,
      required this.name,
      required this.offense,
      required this.vehicleNumber});

      Map<String,String> toJson()=>{
        "vehicle_number":vehicleNumber,
        "name":name,
        "mobile_number":mobileNumber,
        "offense":offense
      };
}
