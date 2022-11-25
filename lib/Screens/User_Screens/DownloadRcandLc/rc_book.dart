import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sidarth_new/Functions/functions.dart';
import 'package:sidarth_new/Functions/storage.dart';
import 'package:sidarth_new/Screens/User_Screens/DownloadRcandLc/rc_book_details.dart';
import 'package:sidarth_new/Screens/User_Screens/DownloadRcandLc/rc_service.dart';
import 'package:sidarth_new/Widgets/widgets.dart';

class RcBook1 extends StatefulWidget {
  RcBook1({super.key});

  @override
  State<RcBook1> createState() => _RcBook1State();
}

class _RcBook1State extends State<RcBook1> {
  TextEditingController rcNumber = TextEditingController();
  TextEditingController enginNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
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
              keyboardType: TextInputType.text,
              onChanged: (value) {
                // rcNumber = int.parse(value);
              },
              controller: rcNumber,
              decoration: const InputDecoration(
                  hintText: "Rc number",
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.text,
              onChanged: (value) {
                // engineNumber = int.parse(value);
              },
              controller: enginNumber,
              decoration: const InputDecoration(
                  hintText: "Engine number",
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                // rcBook(context);

                RCService service = RCService();
                service
                    .service(
                        enginNum: 'JK13EG016',
                        registrationNum: 'KL75B9773',
                        context: context)
                    .then((value) {
                  if (value.statusCode != 200 && value.statusCode != null) {
                    return ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(
                      content: Text("something went wrong"),
                    ));
                  } else {
                    LocalStorage.setRCdetails(json.encode(value));
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(value.data![0].createdAt.toString()),
                    ));
                  }
                });
              },
              child: const Text("Save"),
            ),
            
          ],
        ),
      ),
    );
  }
}
