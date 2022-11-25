import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidarth_new/Functions/storage.dart';
import 'package:sidarth_new/Screens/Police_Screens/Edit_Profile/police_profile_control.dart';
import 'package:sidarth_new/Screens/Police_Screens/Fine%20Details/summons_contrller.dart';
import 'package:sidarth_new/Screens/Police_Screens/Police_Transations/document_controller.dart';
import 'package:sidarth_new/Screens/Police_Screens/Police_Transations/fine_paid_details_service.dart';
import 'package:sidarth_new/Screens/SplashScreen/splashscreen.dart';
import 'package:sidarth_new/Screens/User_Screens/Edit_Profile/edit_profile_controler.dart';
import 'package:sidarth_new/Screens/User_Screens/Usre_Home_Screen/User%20RC%20details/controller_user_home.dart';

import 'Screens/LoginScreens/addmin_login_Screen/login_controller.dart';
import 'Screens/Police_Screens/Fine Details/fine_controller.dart';
import 'Screens/Police_Screens/Police_Home_Screen/police_qrcode_scanner.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Screens/User_Screens/Usre_Home_Screen/User RC details/user_vehicle_number_controller.dart';

Future< void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
await LocalStorage.initStorage();
  runApp(const MYapp());
}



class MYapp extends StatelessWidget {
  const MYapp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
          ChangeNotifierProvider(create: (_) => EditUserProfile()),
          ChangeNotifierProvider(create: (_) => PoliceProfileControl()),
          ChangeNotifierProvider(create: (_) => FineController()),
          ChangeNotifierProvider(create: (_) => LoginController()),
          ChangeNotifierProvider(create: (_) => PoliceQrCodeController()),
          ChangeNotifierProvider(create: (_) => SummonsController()),
          ChangeNotifierProvider(create: (_) => DocumentController()),
          ChangeNotifierProvider(create: (_) => FinePaidDetailsService()),
          ChangeNotifierProvider(create: (_) => UserVehicleNumberController()),
          ChangeNotifierProvider(create: (_) => UserHomeController()),

      ],
      child: const MaterialApp(home: SplashScreen()),
      // child: const MaterialApp(home: UserPay()),
    );
  }
}
