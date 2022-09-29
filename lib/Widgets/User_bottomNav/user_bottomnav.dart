import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sidarth_new/Screens/User_Screens/User_Profile/userprofile.dart';
import 'package:sidarth_new/Screens/User_Screens/numberplate.dart';
import 'package:sidarth_new/Widgets/User_bottomNav/user_bottom_icons.dart';
import 'package:sidarth_new/Widgets/widgets.dart';
import '../../Screens/AddminScreen/addmin_screen.dart';
import '../../Screens/User_Screens/Usre_Home_Screen/user_home_screen.dart';

class UserBottomNav extends StatelessWidget {
  UserBottomNav({super.key});

  final pages = [Number(), UserProfile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        bottomNavigationBar: const UserBottomIcons(),
        appBar: AppBar(
          shape: const Border(
              bottom: BorderSide(color: Colors.white, width: 0.5),
              top: BorderSide(color: Colors.white, width: 0.5),
              left: BorderSide(color: Colors.white, width: 0.5),
              right: BorderSide(color: Colors.white, width: 0.5)),
          title: Row(
            children: const [
              SizedBox(
                width: 40,
                height: 40,
                child: CircleAvatar(
                  radius: 72.0,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('Image/Logo.jpg'),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text('Penalty System',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {
                  logOut(context);
                },
                icon: const Icon(Icons.logout))
          ],
          automaticallyImplyLeading: false,
          backgroundColor: primaryColor,
        ),
        body: ValueListenableBuilder(
          valueListenable: selectedIndex,
          builder: (BuildContext ctx, int updatedindex, Widget? _) {
            return pages[updatedindex];
          },
        ));
  }

  void logOut(BuildContext context) async {
    final oTp = await SharedPreferences.getInstance();
    await oTp.remove("OTP");
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const AddminScreen(),
        ),
        (route) => false);
  }
}
