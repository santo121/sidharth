import 'package:flutter/material.dart';
import 'package:sidarth_new/Functions/functions.dart';
import 'package:sidarth_new/Screens/Police_Screens/Poice_Summons/police_summons_service.dart';
import 'package:sidarth_new/Widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class SummonsNotPaid extends StatelessWidget {
  SummonsNotPaid({super.key});
  final GetPoliceSummonsList getSummons = GetPoliceSummonsList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: SafeArea(
            child: Container(
          margin: const EdgeInsets.all(20),
          child: FutureBuilder(
              future: getSummons.getPoliceSummonsList(),
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  return ListView.builder(
                      itemCount: snapShot.data!.data!.length,
                      itemBuilder: (context, index) {
                        final response = snapShot.data!.data;
                        if (response![index].attachment == null) {
                          return summonsNotPaid(
                            context: context,
                              date: response[index].date.toString(),
                              name: response[index].name.toString(),
                              offense: response[index].offenseId.toString(),
                              regNo: response[index].registernumber.toString());

                        } else {
                          return SizedBox();
                        }
                      });
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        )));
  }

  Widget summonsNotPaid({
    required String name,
    required String date,
    required String regNo,
    required String offense,
    required context
  }) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Name :$name",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Date :$date',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            MyText2(name1: "Reg No :", width: 53, name2: regNo),
            MyText2(name1: "Offense :", width: 50, name2: offense),
            // MyText2(name1: "Amount :", width: 53, name2: "1"),
            // MyText2(name1: "Type Of Transaction", width: 20, name2: "1"),
          ],
        ),
      ),
      Container(
            color: Colors.blue,
            child: TextButton(
              onPressed: () {
                fineNotPaid(context);
              },
              child: const Text(
                "Send As Summons",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
    ]);
  }
}
