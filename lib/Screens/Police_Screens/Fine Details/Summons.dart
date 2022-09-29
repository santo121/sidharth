import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sidarth_new/Functions/functions.dart';
import 'package:sidarth_new/Widgets/widgets.dart';

class Summons extends StatelessWidget {
  Summons({super.key});

  late int offence;

  late String name;

  late dynamic phoneNumber;

  late int stationid;
  late dynamic number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primoryColor,
      appBar: PreferredSize(
          child: AppBar12(title: "SUMMONS", autoAppbar: true),
          preferredSize: Size.fromHeight(60)),
      body: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Summons",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  onChanged: (value) {
                    number = value;
                  },
                  decoration: const InputDecoration(
                      hintText: "KL5919213",
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 10,
                ),
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
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    phoneNumber = value;
                  },
                  decoration: const InputDecoration(
                      hintText: "Mobile Number",
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                    onTap: () {
                      popUpPage1(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      color: Colors.white,
                      child: Text("Offence"),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          if (name.isNotEmpty) {
                            print(name);
                            print(phoneNumber);
                          }
                        },
                        child: const Text("Save  Summons")),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
