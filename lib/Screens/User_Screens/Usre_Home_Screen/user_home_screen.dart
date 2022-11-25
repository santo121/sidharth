import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sidarth_new/Functions/storage.dart';
import 'package:sidarth_new/Screens/Police_Screens/Fine%20AND%20SEMANCE/final_model_service.dart';
import 'package:sidarth_new/Screens/Police_Screens/Fine%20AND%20SEMANCE/fine.dart';
import 'package:sidarth_new/Screens/User_Screens/Contact_your_police_Station/contact_your_police_station.dart';
import 'package:sidarth_new/Screens/User_Screens/DownloadRcandLc/downloadrc_and_lc.dart';
import 'package:sidarth_new/Screens/User_Screens/User_Services/user_services.dart';
import 'package:sidarth_new/Screens/User_Screens/Usre_Home_Screen/list%20of%20summons%20service/user_summons_list.dart';
import 'package:sidarth_new/Screens/User_Screens/Usre_Home_Screen/list_of_summons.dart';
import 'package:sidarth_new/Widgets/widgets.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen(
      {super.key, required this.userId, required this.vehicleNumber});
  final String userId;
  final String vehicleNumber;

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  UserSummonsListService rcSummons = UserSummonsListService();
  UserFineService serviceModel = UserFineService();
  int count = 0;
  int countTwo = 0;
  final val = LocalStorage.getNotificationIndex() ?? 0;
  final valTwo = LocalStorage.getNotificationIndexFIne() ?? 0;

  @override
  void initState() {
    futMethodSummons();
    futMethodFine();
    super.initState();
  }

  void futMethodSummons() async {
    await rcSummons.getUserSummonsList(widget.userId).then((value) {
      setState(() {
        log(value.data!.length.toString());
        log(val.toString());
        count = value.data!.length-val;
      });
    });
  }

  void futMethodFine() async {
    await serviceModel.fineService(userId: widget.userId).then((value) {
      setState(() {
        countTwo = value.data!.length-valTwo;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar12(title: widget.vehicleNumber, autoAppbar: true),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Fine(
                                  userId: widget.userId,
                                )
                            // amount: amount, name: name, offense: offense, regNo: regNo, typeOfTransaction: typeOfTransaction
                            // ),
                            ));
                      },
                      child: const Text("PAY FINE")),
                ),
                Positioned(
                    right: 10,
                    top: 0,
                    bottom: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Text(countTwo  != null ? countTwo .toString() : '0'),
                      radius: 15,
                    ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SummonsList(
                                  rcId: widget.userId,
                                )
                            // amount: amount, name: name, offense: offense, regNo: regNo, typeOfTransaction: typeOfTransaction
                            // ),
                            ));
                      },
                      child: const Text("Receive summons")),
                ),
                Positioned(
                    right: 10,
                    top: 0,
                    bottom: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Text(count != null ? count.toString() : '0'),
                      radius: 15,
                    ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Services(),
                  ));
                },
                child: const Text("SERVICES")),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DownLoadRcAndLc(),
                  ));
                },
                child: const Text("DOWNLOAD RC AND LC")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ContactpoliceStation(),
                  ));
                },
                child: const Text("Contact your police station")),
          ],
        ),
      ),
    );
  }
}
