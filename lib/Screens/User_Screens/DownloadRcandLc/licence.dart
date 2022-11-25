import 'package:flutter/material.dart';
import 'package:sidarth_new/Functions/functions.dart';
import 'package:sidarth_new/Screens/User_Screens/DownloadRcandLc/rc_book_details.dart';
import 'package:sidarth_new/Widgets/widgets.dart';

class Licence extends StatelessWidget {
  Licence({super.key});

  late int licensenumber;
  late int dateofbirth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: (){
                  
                   Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const RcBookHistory()),
  );
                }, child:const Text('View RC BOOK')),
              ],
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
