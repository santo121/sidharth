import 'package:flutter/material.dart';
import 'package:sidarth_new/Functions/functions.dart';
import 'package:sidarth_new/Widgets/widgets.dart';

class Licence extends StatelessWidget {
  Licence({super.key});

  late int licensenumber;
  late int dateofbirth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primoryColor,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            TextField(
              onChanged: (value) {
                licensenumber = int.parse(value);
              },
              decoration: const InputDecoration(
                  hintText: "License number",
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 25,
            ),
            TextField(
              onChanged: (value) {
                dateofbirth = int.parse(value);
              },
              decoration: const InputDecoration(
                  hintText: "Date of birth",
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () {
                  license(context);
                },
                child: Text("Save"))
          ],
        ),
      ),
    );
  }
}
