import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sidarth_new/Functions/functions.dart';
import 'package:sidarth_new/Widgets/widgets.dart';

class RcBook1 extends StatelessWidget {
  RcBook1({super.key});

  late int rcNumber;
  late int engineNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primoryColor,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) {
                rcNumber = int.parse(value);
              },
              decoration: const InputDecoration(
                  hintText: "Rc number",
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              onChanged: (value) {
                engineNumber = int.parse(value);
              },
              decoration: const InputDecoration(
                  hintText: "Engine number",
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () {
                  rcBook(context);
                },
                child: Text("Save"))
          ],
        ),
      ),
    );
  }
}
