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
                              regNo: response[index].registernumber.toString(),
                              //changes
                              address:response[index].address.toString(),
                              phoneNumber: response[index].phoneNumber.toString(),
                              rcId: response[index].rcId.toString(),
                              summonsId: response[index].summonsId.toString(), 
                              );

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
    required String summonsId,
    //changes,
    required String rcId,
    required String address,
    required String phoneNumber,
    required context
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
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
              MyText2(name1: "Reg No       ", width: 53, name2: regNo),
              SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                
                child: MyText2(name1: "Offense      ", width: 50, name2: offense)),
              //changes
              MyText2(name1: "Address      ", width: 50, name2: address),
              MyText2(name1: "Phone number ", width: 50, name2: phoneNumber),
              // MyText2(name1: "RC ID        ", width: 50, name2: rcId),

            ],
          ),
        ),
        Container(
              color: Colors.blue,
              child: TextButton(
                onPressed: () {
                  fineNotPaid(context,summonsId);
                },
                child: const Text(
                  "Send As Summons",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
      ]),
    );
  }
}
