import 'package:flutter/material.dart';
import 'package:sidarth_new/Widgets/widgets.dart';

ValueNotifier<int> selectedIndex = ValueNotifier(0);

class UserBottomIcons extends StatelessWidget {
  const UserBottomIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: selectedIndex,
        builder: (BuildContext ctx, int update, Widget? _) {
          return BottomNavigationBar(
              selectedItemColor: Colors.blue,
              unselectedItemColor: primaryColor,
              currentIndex: update,
              onTap: (value) {
                selectedIndex.value = value;
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle), label: "About us"),
              ]);
        });
  }
}
