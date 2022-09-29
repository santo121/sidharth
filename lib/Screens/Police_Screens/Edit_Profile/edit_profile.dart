import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidarth_new/Screens/LoginScreens/User_login_Screen/addPhoneNumber/phonenumber.dart';
import 'package:sidarth_new/Screens/Police_Screens/Edit_Profile/police_profile_control.dart';
import 'package:sidarth_new/Widgets/widgets.dart';

class EditPoliceProfile extends StatefulWidget {
 const EditPoliceProfile({super.key});

  @override
  State<EditPoliceProfile> createState() => _EditPoliceProfileState();
}

class _EditPoliceProfileState extends State<EditPoliceProfile> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar12(title: "EDIT PROFILE", autoAppbar: true)),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Consumer<PoliceProfileControl>(
              builder: (context,myModel,child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text1(text: "Station address"),
                    TextField(
                      onChanged: (value) {
                        myModel.changeStationAdd(value);
                      },
                      decoration: const InputDecoration(
                          hintText: "Station address",
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder()),
                    ),
                    Text1(text: "Pin number"),
                    TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                       myModel.changePinNumber(value);
                      },
                      decoration: const InputDecoration(
                          hintText: "Pin number",
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder()),
                    ),
                    Text1(text: "Phone Number"),
                    TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        myModel.changePhoneNumber(value);
                      },
                      decoration: const InputDecoration(
                          hintText: "Phone number",
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder()),
                    ),
                    Text1(text: "Si name"),
                    TextField(
                      onChanged: (value) {
                        myModel.changeName(value);
                      },
                      decoration: const InputDecoration(
                          hintText: "Name",
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              if(myModel.phoneNumber!.isNotEmpty&&myModel.name!.isNotEmpty&&myModel.pinNumber!.isNotEmpty&&myModel.stationAdd!.isNotEmpty){
                                log(myModel.toJson().toString());
                              }
                            },
                            child: const Text("Save Profile")),
                      ],
                    )
                  ],
                );
              }
            ),
          )),
    );
  }


}
