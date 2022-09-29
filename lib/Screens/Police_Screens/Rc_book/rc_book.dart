import 'package:flutter/material.dart';
import 'package:sidarth_new/Screens/Police_Screens/Fine%20Details/Summons.dart';
import 'package:sidarth_new/Screens/Police_Screens/Fine%20Details/fine_details.dart';
import 'package:sidarth_new/Widgets/widgets.dart';

class RcBook extends StatelessWidget {
  RcBook(
      {super.key,
      required this.fitnessValUpTo,
      required this.fuelType,
      required this.insuranceVal,
      required this.ownerName,
      required this.puccVal,
      required this.rcStatus,
      required this.registrationDate,
      required this.reqAuth,
      required this.taxVal,
      required this.vecClass,
      required this.vehicleAge});
  String? ownerName,
      reqAuth,
      vecClass,
      rcStatus,
      fuelType,
      vehicleAge,
      registrationDate,
      fitnessValUpTo,
      insuranceVal,
      taxVal,
      puccVal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar12(title: "RC Book", autoAppbar: true),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Rc BOOK",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const Divider(
                color: Colors.white,
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyWidget2(
                          name: "KL5919213",
                          sacondNmae: "",
                        ),
                        MyWidget2(
                          name: "KL5919213",
                          sacondNmae: "",
                        )
                      ],
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    MyWidget2(name: "Owner Name :", width: 18, sacondNmae: "1"),
                    MyWidget2(name: "Reg Auth :", width: 40, sacondNmae: "1"),
                    MyWidget2(name: "Vec Class :", width: 36, sacondNmae: "1"),
                    MyWidget2(name: "Rc Status :", width: 37, sacondNmae: "1"),
                    MyWidget2(name: "Fuel Type :", width: 37, sacondNmae: "1"),
                    MyWidget2(
                        name: "Vehicle Age :", width: 23, sacondNmae: "1"),
                    const Divider(color: Colors.black),
                    MyWidget2(
                        name: "Registration\nDate", width: 50, sacondNmae: "1"),
                    MyWidget2(
                        name: "Fitness Valid\nUp To",
                        width: 45,
                        sacondNmae: "1"),
                    MyWidget2(
                        name: "Insurance Valid\nUpTo",
                        width: 25,
                        sacondNmae: "1"),
                    MyWidget2(
                        name: "Tax Valid\nUpTo", width: 60, sacondNmae: "1"),
                    MyWidget2(
                        name: "P.U.U.C Valid\nUpTo",
                        width: 48,
                        sacondNmae: "1"),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const FineDetails(
                                vehicleNumber: "KL 45 J 2332"),
                          ));
                        },
                        child: const Text("Fine ")),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Summons(),
                        ));
                      },
                      child: const Text("Summons"))
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class MyWidget2 extends StatelessWidget {
  MyWidget2({
    super.key,
    required this.name,
    this.width,
    required this.sacondNmae,
  });

  String name;
  double? width;
  String sacondNmae;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: width,
          ),
          Text(
            sacondNmae,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      SizedBox(
        height: 10,
      )
    ]);
  }
}
