import 'package:flutter/material.dart';
import 'package:sidarth_new/Screens/Police_Screens/Police_Transations/fine_not_paid.dart';
import 'package:sidarth_new/Screens/Police_Screens/Police_Transations/fine_paid.dart';

class Transations extends StatefulWidget {
  const Transations({super.key});

  @override
  State<Transations> createState() => _TransationsState();
}

class _TransationsState extends State<Transations>
    with SingleTickerProviderStateMixin {
  late TabController tabcontroller;

  @override
  void initState() {
    tabcontroller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 25,
        ),
        TabBar(
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.white,
            controller: tabcontroller,
            tabs: [
              Tab(
                text: "Fine Paid",
              ),
              Tab(
                text: "Fine not Paid",
              )
            ]),
        Expanded(
          child: TabBarView(
              controller: tabcontroller, children: [FinePaid(), FineNotPaid()]),
        )
      ],
    );
  }
}
