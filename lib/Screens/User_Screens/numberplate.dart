import 'package:flutter/material.dart';
import 'package:sidarth_new/Screens/User_Screens/Usre_Home_Screen/user_home_screen.dart';
import 'package:sidarth_new/Widgets/widgets.dart';

class Number extends StatelessWidget {
  const Number({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => UsreHomeScreen(),
                  ));
                },
                child: const Text("KL 08 BC541")),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(onPressed: () {}, child: const Text("KL 08 BC7565"))
          ],
        ));
  }
}
