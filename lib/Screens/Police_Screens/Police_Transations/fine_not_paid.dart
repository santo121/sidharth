import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sidarth_new/Functions/functions.dart';
import 'package:sidarth_new/Screens/LoginScreens/User_login_Screen/addPhoneNumber/phonenumber.dart';
import 'package:sidarth_new/Screens/Police_Screens/Fine%20Details/fine_to_summons_service.dart';
import 'package:sidarth_new/Screens/Police_Screens/Police_Transations/fine_paid_details_service.dart';
import 'package:sidarth_new/Widgets/police_bottomNav/bottomnav.dart';
import 'package:sidarth_new/Widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class FineNotPaid extends StatelessWidget {
 FineNotPaid({super.key});
FinePaidDetailsService service = FinePaidDetailsService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(35),
          child:FutureBuilder(
                  future: service.getFinDetails(psId: "1"),
                  builder: (context,val) {
                    if(val.hasData){
                      
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                      itemCount: val.data!.data!.length,
                      itemBuilder: (context,index) {
                        final data = val.data!.data;
                        if (data![index].mode=='online'||data[index].mode==null){
                          return 
                        fineNotPaidCard(context,amount: data[index].amount.toString(),
                        fineId:data[index].fineId.toString() ,
                        name: data[index].name.toString(),
                        offense: data[index].offenseId.toString(),
                        regNo: data[index].registernumber.toString(),
                        typeOfTransaction: data[index].mode.toString(),
                        phoneNum: data[index].phoneNumber.toString(),

                        );
                        }
                        else return SizedBox();
                      }, 
                    );
                    }
                    else{
                    return  Center(child: CircularProgressIndicator());
                    }
                    
                  }
                ),
              
              
              
        )));
  }

  Column fineNotPaidCard(BuildContext context,
   {
    required String name,
  
    required String regNo,
    required String offense,
    required String amount,
    required String typeOfTransaction,
    required String fineId,
    required String phoneNum,
   }
  ) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Name : $name",
                      style:const TextStyle(fontWeight: FontWeight.bold),
                    ),
                   
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                MyText2(name1: "Reg No : ", width: 53, name2: regNo),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: MyText2(name1: "Offense :", width: 50, name2:  offense)),
                MyText2(name1: "Amount : ", width: 53, name2: amount),
                MyText2(name1: "Type Of Transaction :", width: 20, name2:'online'),
                MyText2(name1: "Phone number :", width: 20, name2:phoneNum),
                IconButton(onPressed: (){_makePhoneCall(phoneNum);}, icon:const Icon(Icons.call))
              ],
            ),
          ),
          Container(
            color: Colors.blue,
            child: TextButton(
              onPressed: () {
                FineToSummonsModal model = FineToSummonsModal(fineId: fineId);
                FineToSummons service =FineToSummons();
                service.sentFineToSummons(model).then((value) {
                  log(value.statusCode.toString());
                  value.statusCode==200?Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => PoliceBottomNav(pageIndex: 2,)), (route) => false):log(value.statusCode.toString());
                });
              },
              child: const Text(
                "Send As Summons",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ]);
  }
   Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}
