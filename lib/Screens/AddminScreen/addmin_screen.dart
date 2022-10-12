import 'package:flutter/material.dart';
import 'package:sidarth_new/Screens/LoginScreens/addmin_login_Screen/addminscreen.dart';
import 'package:sidarth_new/Screens/LoginScreens/User_login_Screen/addPhoneNumber/phonenumber.dart';
import 'package:sidarth_new/Widgets/widgets.dart';

class AddminScreen extends StatelessWidget {
  const AddminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar12(title: "Penalty System", autoAppbar: false),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddminLogin(),
                ));
              },
              child: Container(
                width: 270,
                height: 50,
                decoration: const BoxDecoration(color: Colors.blue),
                child: const Center(
                  child: Text(
                    "Police",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PhoneNumber()
              ));
            },
            child: Container(
              width: 270,
              height: 50,
              decoration: const BoxDecoration(color: Colors.white),
              child: const Center(
                child: Text(
                  "User",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
