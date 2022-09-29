import 'package:flutter/material.dart';
import 'package:sidarth_new/Screens/Police_Screens/Poice_Summons/summons_not_paid.dart';
import 'package:sidarth_new/Screens/Police_Screens/Poice_Summons/summons_send.dart';

class Summons extends StatefulWidget {
  const Summons({super.key});

  @override
  State<Summons> createState() => _SummonsState();
}

class _SummonsState extends State<Summons> with SingleTickerProviderStateMixin {
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
                text: "Summons Send",
              ),
              Tab(
                text: "Summons not send",
              )
            ]),
        Expanded(
          child: TabBarView(
              controller: tabcontroller,
              children: [SummonsSend(), SummonsNotPaid()]),
        )
      ],
    );
  }
}
