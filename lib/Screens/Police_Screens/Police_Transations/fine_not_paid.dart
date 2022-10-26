import 'package:flutter/material.dart';
import 'package:sidarth_new/Functions/functions.dart';
import 'package:sidarth_new/Screens/Police_Screens/Police_Transations/fine_paid_details_service.dart';
import 'package:sidarth_new/Widgets/widgets.dart';

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
                        if (data![index].mode=='online'){
                          return 
                        fineNotPaidCard(context,amount: data[index].amount.toString(),
                        name: data[index].name.toString(),
                        offense: data[index].offenseId.toString(),
                        regNo: data[index].rcId.toString(),
                        typeOfTransaction: data[index].mode.toString()
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
   }
  ) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(
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
                MyText2(name1: "Offense :", width: 50, name2:  offense),
                MyText2(name1: "Amount : ", width: 53, name2: amount),
                MyText2(name1: "Type Of Transaction :", width: 20, name2: typeOfTransaction),
                IconButton(onPressed: () {}, icon: Icon(Icons.call))
              ],
            ),
          ),
          Container(
            color: Colors.blue,
            child: TextButton(
              onPressed: () {
                fineNotPaid(context);
              },
              child: const Text(
                "Send As Summons",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ]);
  }
}
