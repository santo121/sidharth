import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sidarth_new/Screens/LoginScreens/addmin_login_Screen/login_controller.dart';
import 'package:sidarth_new/Screens/LoginScreens/addmin_login_Screen/login_service.dart';
import 'package:sidarth_new/Screens/Police_Screens/Edit_Profile/edit_profile.dart';
import 'package:sidarth_new/Widgets/police_bottomNav/bottomnav.dart';
import 'package:sidarth_new/Widgets/widgets.dart';

class AddminLogin extends StatelessWidget {
  AddminLogin({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: PreferredSize(
        child: AppBar12(
          title: "Penalty System",
          autoAppbar: false,
        ),
        preferredSize: Size.fromHeight(60),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Consumer<LoginController>(
          builder: (context,myModel,child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Police Station Login',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const Divider(
                  color: Colors.white24,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text1(text: "Username"),
                SizedBox(
                  height: 40,
                  child: TextField(
                      style: const TextStyle(color: Colors.black),
                      onChanged: (val){
                        myModel.changeLogin(val.trim());
                      },
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "username",
                          hintStyle: TextStyle(
                            color: Colors.black38,
                          ),
                          border: OutlineInputBorder())),
                ),
                Text1(text: "Password"),
                SizedBox(
                  height: 40,
                  child: TextField(
                      style: const TextStyle(color: Colors.black),
                      onChanged: (val){
                          myModel.changePassword(val.trim());
                      },
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "password",
                          hintStyle: TextStyle(color: Colors.black38),
                          border: OutlineInputBorder())),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      // updateAnswer(context);
                      log(myModel.toJson().toString());
                      if(myModel.loginUser!=null&&myModel.password!=null){

                        // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:(context) => PoliceBottomNav() ), (route) => false);
                        LogoInService server =LogoInService();
                        server.callLoginService(myModel.toJson()).then((value) async{
                         if( value.statusCode==null){
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:(context) => PoliceBottomNav() ), (route) => false);
                       final response = await SharedPreferences.getInstance();
                       await response.setBool('name', true);
                       await response.setString("station_name",value.data!.stationName.toString());
                       await response.setString("postoffice",value.data!.place.toString());
                       await response.setString("pin",value.data!.pin.toString());
                       await response.setString("phone_number",value.data!.pin.toString());
                       await response.setString("PS_place",value.data!.pin.toString());
                         }
                         else{
                         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  content: Text("You'r password incorrect"),
));
                         }
                        
                        });
        log("message");

                      }
                      else{log(myModel.toJson().toString());}
                    },
                    child: const Center(
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.black),
                      ),
                    ))
              ],
            );
          }
        ),
      ),
    );
  }

  // void updateAnswer(BuildContext context) async {
  //   final name1 = username.text;
  //   final password1 = password.text;
  //   if (name1.isNotEmpty && password1.isNotEmpty) {
  //     final login = await SharedPreferences.getInstance();
  //     await login.setBool("name", true);
  //     Navigator.of(context).pushAndRemoveUntil(
  //         MaterialPageRoute(
  //           builder: (context) => PoliceBottomNav(),
  //         ),
  //         (route) => false);
  //   } else if (name1.isEmpty && password1.isEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //         backgroundColor: Colors.red,
  //         behavior: SnackBarBehavior.floating,
  //         content: Text("Enter username  and password")));
  //   } else if (name1.isEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //         backgroundColor: Colors.red,
  //         behavior: SnackBarBehavior.floating,
  //         content: Text("Enter Username")));
  //   } else if (password1.isNotEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //         behavior: SnackBarBehavior.floating,
  //         backgroundColor: Colors.red,
  //         content: Text("Enter Password")));
  //   }
  // }
}
