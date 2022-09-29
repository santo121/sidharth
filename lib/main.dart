import 'package:flutter/material.dart';
import 'package:sidarth_new/Screens/SplashScreen/splashscreen.dart';

void main() {
  runApp(const MYapp());
}

class MYapp extends StatelessWidget {
  const MYapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: SplashScreen());
  }
}
