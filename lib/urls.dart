String ipAddress = "penalty.gitdr.com";
// http://192.168.1.79:8001/api/login
String policeStationLoginUrl = "https://$ipAddress/api/login";
String regFineList({required id}){
  return "https://$ipAddress/api/fine_station?station_id=$id";
}

String sendFines = "https://$ipAddress/api/fine";
String userLogin = "https://$ipAddress/api/citizenlogin";
String userFineList ({required String id}){
  return  "https://$ipAddress/api/fine_citizen?rc_id=$id";
}
String userRcDetailsApi = "https://$ipAddress/api/rc_user";

String userSummonsList({required String id}) => "https://$ipAddress/api/summons_citizen?rc_id=$id";
String policeSummonsApi({required String id}) => "https://$ipAddress/api/summons_station?station_id=$id";