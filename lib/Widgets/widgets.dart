import 'package:flutter/material.dart';

final primaryColor = Color.fromARGB(131, 5, 30, 100);

class MyText2 extends StatelessWidget {
  MyText2(
      {super.key,
      required this.name1,
      required this.width,
      required this.name2});

  String name1;
  double width;
  String name2;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Text(
            name1,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: width,
          ),
          Text(
            name2,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      )
    ]);
  }
}

class AppBar12 extends StatelessWidget {
  AppBar12({super.key, required this.title, required this.autoAppbar});

  String title;
  bool autoAppbar;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: autoAppbar,
      elevation: 0,
      shape: const Border(
          bottom: BorderSide(color: Colors.white, width: 0.5),
          top: BorderSide(color: Colors.white, width: 0.5),
          left: BorderSide(color: Colors.white, width: 0.5),
          right: BorderSide(color: Colors.white, width: 0.5)),
      shadowColor: Colors.white,
      backgroundColor: primaryColor,
      title: Row(
        children: [
          const SizedBox(
            width: 40,
            height: 40,
            child: CircleAvatar(
              radius: 72.0,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('Image/Logo.jpg'),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(title,
              style: const TextStyle(fontSize: 20, color: Colors.white)),
        ],
      ),
    );
  }
}

// DROP DOWN PAGE

class DropButton extends StatelessWidget {
  DropButton({super.key});
  ValueNotifier<List<String>> items = ValueNotifier(["Online", "Offline"]);

  String selectedItem = 'Online';

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: items,
      builder: (BuildContext ctx, List<String> updatedValue, Widget? _) {
        return DropdownButton<String>(
          focusColor: Colors.white,
          value: selectedItem,
          items: updatedValue
              .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w300),
                  )))
              .toList(),
          onChanged: (item) {
            if (item == null) {
              return;
            }
            selectedItem = item;
            items.notifyListeners();
          },
        );
      },
    );
  }
}

class CheckButton extends StatelessWidget {
  CheckButton({super.key, required this.title});

  ValueNotifier<bool> value1 = ValueNotifier(false);
  String title;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: value1,
        builder: (BuildContext ctx, bool updatedValue, Widget? _) {
          return ListTile(
            leading: Checkbox(
              side: const BorderSide(color: Colors.white),
              value: updatedValue,
              onChanged: (value) {
                if (value == null) {
                  return;
                }
                value1.value = value;
              },
            ),
            title: Text(
              title,
              style: const TextStyle(color: Colors.white),
            ),
          );
        });
  }
}

class Text1 extends StatelessWidget {
  Text1({super.key, required this.text});

  String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(text, style: const TextStyle(color: Colors.white)),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
