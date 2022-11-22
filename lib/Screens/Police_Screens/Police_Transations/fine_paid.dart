import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidarth_new/Screens/Police_Screens/Police_Transations/fine_paid_details_service.dart';
import 'package:sidarth_new/Widgets/widgets.dart';
import 'package:sidarth_new/cont_file.dart';

class FinePaid extends StatelessWidget {
  FinePaid({super.key});
FinePaidDetailsService service = FinePaidDetailsService();
  @override
  Widget build(BuildContext context) {
   
        return Scaffold(
            backgroundColor: primaryColor,
            body: SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(35),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: FutureBuilder(
                  future: service.getFinDetails(psId: "1"),
                  builder: (context,val) {
                    if(val.hasData){
                      
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                      itemCount: val.data!.data!.length,
                      itemBuilder: (context,index) {
                        final data = val.data!.data;
                        if (data![index].mode!='online'&&data[index].mode!=null){
                          return 
                        Container(
                          margin:const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.all(20),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Name :${data[index].name}",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Date :${data[index].updatedAt}',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                
                                child: MyText2(name1: "Registration Number ", width: 90, name2:data[index].registernumber.toString())),
                              MyText2(name1: "Offense ", width: 90, name2:data[index].offenseId.toString()),
                              MyText2(name1: "Amount ", width: 91, name2: data[index].amount.toString() ),
                              MyText2(name1: "Type Of Transaction", width: 20, name2: data[index].mode.toString() ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: MyText2(name1: "Phone number", width: 53, name2: data[index].phoneNumber.toString() ))
                            ],
                          ),
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
              ),
            )));



    
  
}}


