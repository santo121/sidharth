import 'package:flutter/material.dart';
import 'package:sidarth_new/Functions/functions.dart';

class PoliceHomeScreen extends StatelessWidget {
  PoliceHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            child: Image.asset("Image/IMG_20220928_155138.png"),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  scan(context);
                },
                child: const Text("Scan Vehicle Rc")),
          ),
        ],
      ),
    );
  }
}
