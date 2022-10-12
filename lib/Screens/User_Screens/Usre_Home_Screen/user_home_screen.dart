import 'package:flutter/material.dart';
import 'package:sidarth_new/Screens/Police_Screens/Fine%20AND%20SEMANCE/fine.dart';
import 'package:sidarth_new/Screens/User_Screens/Contact_your_police_Station/contact_your_police_station.dart';
import 'package:sidarth_new/Screens/User_Screens/DownloadRcandLc/downloadrc_and_lc.dart';
import 'package:sidarth_new/Screens/User_Screens/User_Services/user_services.dart';
import 'package:sidarth_new/Screens/User_Screens/Usre_Home_Screen/list_of_summons.dart';
import 'package:sidarth_new/Widgets/widgets.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key,required this.userId});
final String userId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar12(title: "kl", autoAppbar: true),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Fine(userId:userId,)
                      // amount: amount, name: name, offense: offense, regNo: regNo, typeOfTransaction: typeOfTransaction
                      // ),
                  ));
                },
                child: const Text("PAY FINE")),
                const SizedBox(
              height: 10,
            ),
                ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>  SummonsList(rcId: userId,)
                      // amount: amount, name: name, offense: offense, regNo: regNo, typeOfTransaction: typeOfTransaction
                      // ),
                  ));
                },
                child: const Text("Receive summons")),
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
