import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sidarth_new/Functions/functions.dart';
import 'package:sidarth_new/Widgets/widgets.dart';
import 'package:sidarth_new/models/fine_model.dart';

class FineDetails extends StatelessWidget {
  FineDetails({super.key});

  late int offence;

  late dynamic rcid;

  late dynamic amount;

  late String name;

  late dynamic phoneNumber;

  late int date;

  late bool mode;

  late int stationid;
  late dynamic number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primoryColor,
      appBar: PreferredSize(
          child: AppBar12(title: "Fine", autoAppbar: true),
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
                  "Fine ",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    number = value;
                  },
                  decoration: const InputDecoration(
                      hintText: "KL5919213",
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder()),
                ),
                SizedBox(
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
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    amount = value;
                  },
                  decoration: const InputDecoration(
                      hintText: "Amount",
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
                    rcid = value;
                  },
                  decoration: const InputDecoration(
                      hintText: "Rc id",
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.white,
                  child: DropButton(),
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
                          checkValue();
                        },
                        child: Text("Send Fine")),
                  ],
                )
              ],
            ),
          )),
    );
  }

  void checkValue() async {
    if (rcid != null) {
      print(rcid);
    }

    // FineModel(
    //   offenseid: offence,
    //   rcid: rcid,
    //   name: name,
    //   phonenumber: phoneNumber,
    //   date: date,
    //   stationid: stationid,
    //   mode: DropButton().selectedItem,
    // );
  }
}
