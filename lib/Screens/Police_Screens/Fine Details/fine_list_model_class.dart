import 'package:flutter/material.dart';

class FineModelClass{
  bool checkFlag;
  String fineName;
  FineModelClass({required this.checkFlag,required this.fineName});
}

@immutable
class CheckButton extends StatelessWidget {
CheckButton({super.key ,required this.title,required this.valFnc,required this.value});
final String title;
final bool value;
void Function(bool?) valFnc;
  @override
  Widget build(BuildContext context) {
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