import 'package:sidarth_new/Screens/Police_Screens/Fine%20Details/fine_controller.dart';

class OffenseModel{
  String vehicleNumber,name,mobileNumber,amount,address,modeOfPayment,rcId,stationId,selectedOffense;

  OffenseModel({
    required this.address,
    required this.amount,
    required this.name,
    required this.mobileNumber,
    required this.modeOfPayment,
    required this.selectedOffense,
    required this.vehicleNumber,
    required this.rcId,
    required this.stationId
});
  
  Map<String,String> toJson(){
 
    return {
        "offense_id":selectedOffense.toString(),
        "rc_id":rcId.toString(),
        "name":name.toString(),
        "phone_number":mobileNumber.toString(),
        "mode":'online',
        "station_id":stationId.toString(),
        "amount":amount.toString(),
        "address":address.toString()
  
  
      // "vehicle_number":vehicleNumber.toString(),
      // "name":name,
      // "mobile_number":mobileNumber.toString(),
      // "offense":selectedOffense.toString(),
      // "amount":amount,
      // "address":address,
      // "mode_of_payment":modeOfPayment
    };

  }
  
}