import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidarth_new/Screens/User_Screens/Edit_Profile/edit_profile_controler.dart';
import 'package:sidarth_new/Widgets/widgets.dart';

class EditUsrProfile extends StatelessWidget {
  EditUsrProfile({super.key});

  ValueNotifier<List<String>> items = ValueNotifier(['Online', 'Offline']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar12(title: "EDIT PROFILE", autoAppbar: false)),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Consumer<EditUserProfile>(
              builder: (context,myModel,child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text1(text: "User name"),
                    TextField(
                      keyboardType: TextInputType.name,
                      onChanged: (value) {
                        myModel.addUserName(value);
                      },
                      decoration: const InputDecoration(
                          hintText: "User name",
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder()),
                    ),
                    Text1(text: "House name"),
                    TextField(
                      onChanged: (value) {
                        myModel.addHouseName(value);

                      },
                      decoration: const InputDecoration(
                          hintText: "House name",
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder()),
                    ),
                    Text1(text: "District"),
                    TextField(
                      onChanged: (value) {
                        myModel.addDistrict(value);
                      },
                      decoration: const InputDecoration(
                          hintText: "District",
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder()),
                    ),
                    Text1(text: "Pin number"),
                    TextField(
                      keyboardType: TextInputType.number,

                      onChanged: (value) {
                        myModel.addPin(value);

                      },
                      decoration: const InputDecoration(
                          hintText: "Pin number",
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text1(text: "Phone number"),
                    TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        myModel.addPoneNumber(value);
                      },
                      decoration: const InputDecoration(
                          hintText: "Phone number",
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                            if(myModel.district!=null && myModel.houseName!=null && myModel.phoneNumber!=null && myModel.pin!=null && myModel.userName!=null){
                            log(myModel.toJson().toString()); 
                            }
                            else{
                            log("add value"); 

                            }

                            }, child: const Text("Save Profile")),
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
