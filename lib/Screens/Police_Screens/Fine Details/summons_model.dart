
class SummonsModel {
  String vehicleNumber, name, mobileNumber, offense,date,address;
  SummonsModel(
      {required this.mobileNumber,
      required this.name,
      required this.offense,
      required this.vehicleNumber,
      required this.date,
      required this.address
 
      
      });

      Map<String,String> toJson()=>{
        "rc_id":1.toString(),
        "name":name,
        "phone_number":mobileNumber.toString(),
        "offense_id":offense.toString(),
        'date':date.toString(),
        'mode':'offline',
        'station_id':1.toString(),
        'address':address
      };
}
