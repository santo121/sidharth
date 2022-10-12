import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sidarth_new/Screens/Police_Screens/Poice_Summons/summons.dart';
import 'package:sidarth_new/Screens/Police_Screens/Police_Profile/profile.dart';
import 'package:sidarth_new/Screens/AddminScreen/addmin_screen.dart';
import 'package:sidarth_new/Screens/Police_Screens/Police_Home_Screen/poice_home_screen.dart';
import 'package:sidarth_new/Screens/Police_Screens/Police_Transations/transaction.dart';
import 'package:sidarth_new/Widgets/police_bottomNav/police_bottom_icons.dart';
import 'package:sidarth_new/Widgets/widgets.dart';

class PoliceBottomNav extends StatelessWidget {
  final int pageIndex;

  PoliceBottomNav({super.key ,this.pageIndex=0});
  // PloiceBottomNav({});
  final pages = [
    PoliceHomeScreen(),
    Transations(),
    Summons(),
    PoliceProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        bottomNavigationBar: PoliceBottomIcons(pageIndex: pageIndex),
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
              Text('Police Station',
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
    final login = await SharedPreferences.getInstance();
    await login.remove('name');
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => AddminScreen(),
        ),
        (route) => false);
  }
}
