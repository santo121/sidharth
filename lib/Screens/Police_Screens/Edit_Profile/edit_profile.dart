import 'package:flutter/material.dart';
import 'package:sidarth_new/Screens/LoginScreens/User_login_Screen/addPhoneNumber/phonenumber.dart';
import 'package:sidarth_new/Widgets/widgets.dart';

class EditPoliceProfile extends StatefulWidget {
  EditPoliceProfile({super.key});

  @override
  State<EditPoliceProfile> createState() => _EditPoliceProfileState();
}

class _EditPoliceProfileState extends State<EditPoliceProfile> {
  late String stationAddress;

  late dynamic pinNumber;

  late dynamic phoneNumber;

  late String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primoryColor,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar12(title: "EDIT PROFILE", autoAppbar: true)),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text1(text: "Station address"),
                TextField(
                  onChanged: (value) {
                    stationAddress = value;
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
                    pinNumber = value;
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
                    phoneNumber = value;
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
                    name = value;
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
                          editDetails();
                        },
                        child: const Text("Save Profile")),
                  ],
                )
              ],
            ),
          )),
    );
  }

  void editDetails() {
    // final station1 = stationAddress.isNotEmpty;
    // final pin1 = pinNumber != null;
    // final phone = phoneNumber != null;
    final name1 = name.isNotEmpty;
    print(name1);
  }
}
