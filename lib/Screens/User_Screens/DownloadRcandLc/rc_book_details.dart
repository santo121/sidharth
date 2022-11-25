import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sidarth_new/Functions/storage.dart';
import 'package:sidarth_new/Screens/User_Screens/DownloadRcandLc/rc_response.dart';

class RcBookHistory extends StatefulWidget {
  const RcBookHistory({super.key});

  @override
  State<RcBookHistory> createState() => _RcBookHistoryState();
}

class _RcBookHistoryState extends State<RcBookHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'RC CARD',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
          child: ListView.builder(
              itemCount: RCResponse.fromJson(
                      json.decode(LocalStorage.getRCdetails().toString()))
                  .data!
                  .length,
              itemBuilder: (context, index) {
                final val = RCResponse.fromJson(
                        json.decode(LocalStorage.getRCdetails().toString()))
                    .data!;
                return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(2, 2),
                              blurRadius: 3,
                              color: Colors.grey)
                        ]),
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Engine Number'),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Insurance valid up to'),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Phone number'),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Rc id'),
                            SizedBox(
                              height: 10,
                            ),
                            Text('RC Status'),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Registration number'),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Registration date'),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Tax valid up to'),
                          ],
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(val[index].engineno.toString()),
                           const SizedBox(
                              height: 10,
                            ),
                            Text(val[index].insurancevalidupto.toString()),
                            SizedBox(
                              height: 10,
                            ),
                            Text(val[index].phonenumber.toString()),
                            SizedBox(
                              height: 10,
                            ),
                            Text(val[index].rcId.toString()),
                            SizedBox(
                              height: 10,
                            ),
                            Text(val[index].rcStatus.toString()),
                            SizedBox(
                              height: 10,
                            ),
                            Text(val[index].registernumber.toString()),
                            SizedBox(
                              height: 10,
                            ),
                            Text(val[index].registrationdate.toString()),
                            SizedBox(
                              height: 10,
                            ),
                            Text(val[index].taxvalidupto.toString()),
                          ],
                        ),
                      ],
                    ));
              })),
    );
  }
}
