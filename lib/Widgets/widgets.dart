import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidarth_new/Screens/Police_Screens/Fine%20Details/fine_controller.dart';

final primaryColor = Color.fromARGB(131, 5, 30, 100);

class MyText2 extends StatelessWidget {
  MyText2(
      {super.key,
      required this.name1,
      this.width,
      required this.name2});

  String name1;
  double? width;
  String name2;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 200,
            child: Text(
              name1,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
         Text(':'),
         SizedBox(width: 5,),
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
        
          Text(title,
              style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
        ],
      ),
    );
  }
}

// DROP DOWN PAGE

class DropButton extends StatelessWidget {
  DropButton({super.key,required this.onTap});
  ValueNotifier<List<String>> items = ValueNotifier(["Online", "Offline"]);
final Function(String? val) onTap;
  String selectedItem = 'Online';

  @override
  Widget build(BuildContext context) {
    return Consumer<FineController>(
              builder: (context,myModel,child) {
        return ValueListenableBuilder(
          valueListenable: items,
          builder: (BuildContext ctx, List<String> updatedValue, Widget? _) {
            return DropdownButton<String>(
              focusColor: Colors.white,
              value: myModel.modeOfFine,
              items: myModel.payMode
                  .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w300),
                      )))
                  .toList(),
              onChanged:onTap,
              
              
               
            );
          },
        );
      }
    );
  }
}

// class CheckButton extends StatelessWidget {
//   CheckButton({super.key, required this.title});

//  final ValueNotifier<bool> value1 = ValueNotifier(false);
//  final String title;

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//         valueListenable: value1,
//         builder: (BuildContext ctx, bool updatedValue, Widget? _) {
//           return ListTile(
//             leading: Checkbox(
//               side: const BorderSide(color: Colors.white),
//               value: updatedValue,
//               onChanged: (value) {
//                 if (value == null) {
//                   return;
//                 }
//                 value1.value = value;
//               },
//             ),
//             title: Text(
//               title,
//               style: const TextStyle(color: Colors.white),
//             ),
//           );
//         });
//   }
// }

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
