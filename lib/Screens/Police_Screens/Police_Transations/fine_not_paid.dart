import 'package:flutter/material.dart';
import 'package:sidarth_new/Functions/functions.dart';
import 'package:sidarth_new/Widgets/widgets.dart';

class FineNotPaid extends StatelessWidget {
  const FineNotPaid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primoryColor,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(35),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Name :",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Date :',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  MyText2(name1: "Reg No :", width: 53, name2: "1"),
                  MyText2(name1: "Offense :", width: 50, name2: "1"),
                  MyText2(name1: "Amount :", width: 53, name2: "1"),
                  MyText2(name1: "Type Of Transaction", width: 20, name2: "1"),
                  IconButton(onPressed: () {}, icon: Icon(Icons.call))
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
                  "Send As Semance",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ]),
        )));
  }
}
