import 'dart:developer';

import 'package:flutter/material.dart';

class FineModelClass{
  bool checkFlag;
  String fineName;
  int indexVal;
  FineModelClass({required this.checkFlag,required this.fineName,required this.indexVal});
}

@immutable
class CheckButton extends StatelessWidget {
CheckButton({super.key ,required this.title,required this.valFnc,required this.value,required this.indexVal});
final String title;
final bool value;
void Function(bool?) valFnc;
int indexVal;
  @override
  Widget build(BuildContext context) {
    // log(indexVal.toString());
    return  ListTile(
      leading: Checkbox(
              side: const BorderSide(color: Colors.white),
              value: value,
              onChanged:valFnc,
            ),
          title: Text(
              title,
              style:const TextStyle(color: Colors.white),
            ),
      
    );
    
    
  }
}