import 'package:shared_preferences/shared_preferences.dart';
class LocalStorage{

 static late SharedPreferences preferences;

static Future initStorage()async=>
    preferences = await SharedPreferences.getInstance();



static Future setRCdetails(String encodedData)async => await preferences.setString('musics_key', encodedData);
static Future setNotificationIndex(int encodedData)async => await preferences.setInt('not_int', encodedData);
static Future setNotificationIndexFine(int encodedData)async => await preferences.setInt('not_int_fine', encodedData);
static  int? getNotificationIndexFIne() => preferences.getInt('not_int_fine');
static  int? getNotificationIndex() => preferences.getInt('not_int');
static  String? getRCdetails() => preferences.getString('musics_key');

                          // pref.setInt('Period', myModel.selectedAmount);



 
}