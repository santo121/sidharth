import 'package:flutter/material.dart';
import 'package:sidarth_new/Widgets/widgets.dart';

class Fine extends StatelessWidget {
  const Fine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primoryColor,
      appBar: PreferredSize(
          child: AppBar12(title: "Fine and Summons", autoAppbar: false),
          preferredSize: Size.fromHeight(60)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'PAY FINE AND SEMANCE',
              style: TextStyle(color: Colors.white),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
              color: Colors.white,
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText2(name1: "Name:", width: 118, name2: "1"),
                  MyText2(name1: "Reg No:", width: 110, name2: "1"),
                  MyText2(name1: "Offense:", width: 110, name2: "1"),
                  MyText2(name1: "Amount:", width: 110, name2: "1"),
                  MyText2(name1: "Type of Transaction:", width: 35, name2: "1"),
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                color: Colors.blue,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "PAY FINE",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
              color: Colors.white,
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText2(name1: "Name:", width: 118, name2: "1"),
                  MyText2(name1: "Reg No:", width: 110, name2: "1"),
                  MyText2(name1: "Offense", width: 110, name2: "1"),
                  MyText2(name1: "Amount", width: 110, name2: "1"),
                  MyText2(name1: "Download Semance", width: 35, name2: "1"),
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                color: Colors.blue,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "ACCEPET SEMANCE",
                    style: TextStyle(color: Colors.white),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
