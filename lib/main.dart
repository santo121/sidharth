import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidarth_new/Screens/Police_Screens/Edit_Profile/police_profile_control.dart';
import 'package:sidarth_new/Screens/SplashScreen/splashscreen.dart';
import 'package:sidarth_new/Screens/User_Screens/Edit_Profile/edit_profile_controler.dart';

import 'Screens/LoginScreens/addmin_login_Screen/login_controller.dart';
import 'Screens/Police_Screens/Fine Details/fine_controller.dart';
import 'Screens/Police_Screens/Police_Home_Screen/police_qrcode_scanner.dart';

void main() {
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

      ],
      child: const MaterialApp(home: SplashScreen()),
    );
  }
}
