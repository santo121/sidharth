import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sidarth_new/Functions/functions.dart';
import 'package:sidarth_new/Screens/Police_Screens/Fine%20Details/fine_controller.dart';
import 'package:sidarth_new/Screens/Police_Screens/Fine%20Details/fine_list_model_class.dart';
import 'package:sidarth_new/Screens/Police_Screens/Fine%20Details/summons_contrller.dart';
import 'package:sidarth_new/Screens/Police_Screens/Fine%20Details/summons_model.dart';
import 'package:sidarth_new/Widgets/widgets.dart';

import '../../../cont_file.dart';

class Summons extends StatelessWidget {
  Summons({super.key,required this.vehicleNumber});
  String vehicleNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: PreferredSize(
          child: AppBar12(title: "SUMMONS", autoAppbar: true),
          preferredSize: Size.fromHeight(60)),
      body: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Builder(
              builder: (context) {
                return Consumer<SummonsController>(
                  builder: (context,myModel,child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Summons",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          onChanged: (value) {
                            // number = value;
                            myModel.changeVehicleNumber(vehicleNumber);
                          },
                          decoration: InputDecoration(
                              hintText:vehicleNumber,
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          onChanged: (value) {
                            // name = value;
                            myModel.changeName(value);
                          },
                          decoration: const InputDecoration(
                              hintText: "Name",
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            // phoneNumber = value;
                            myModel.changeMobileNumber(value);
                          },
                          decoration: const InputDecoration(
                              hintText: "Mobile Number",
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                            onTap: () {
                              popUpPage1(context);
                            },
                            child: Container(
                              padding: EdgeInsets.all(20),
                              color: Colors.white,
                              child:Consumer<FineController>(
                                    builder: (context,myModelData,child) {
                                      final val= myModelData.selectedOffense;
                                      return myModelData.selectedOffense.isEmpty?const Text("Offense"):
                                      Text(myModelData.selectedOffense.listToString());
                                    }
                                  ),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                           
                                 Consumer<FineController>(
                                    builder: (context,myModelData,child) {
                                     return ElevatedButton(
                                        onPressed: () {
                                          log("dc ${myModel.mobileNumber}");
                                          log("dc ${myModel.name}");
                                          log("dc ${myModelData.selectedOffense}");
                                          log("dc ${myModel.vehicleNumber}");
                                          if(
                                            myModel.mobileNumber.isNotEmpty&&
                                            myModel.name.isNotEmpty&&
                                            myModelData.selectedOffense.isNotEmpty&&
                                            vehicleNumber.isNotEmpty
                                          ){
                                             SummonsModel saveData= SummonsModel(
                                            mobileNumber: myModel.mobileNumber,
                                            name: myModel.name,
                                            offense: myModelData.selectedOffense.toString(),
                                            vehicleNumber: vehicleNumber,
                                            );
                                            log(saveData.toJson().toString());
                                          }
                                         
                                          
                                        },
                                        child: const Text("Save  Summons"));
                                   }
                                 )
                              
                            
                          ],
                        )
                      ],
                    );
                  }
                );
              }
            ),
          )),
    );
  }

  popUpPage1(BuildContext context) {
  showDialog(
    context: context,
    builder: (ctx) {
      return Consumer<FineController>(
        builder: (context,myModel,child) {
          return SimpleDialog(
              elevation: 20,
              backgroundColor: const Color.fromARGB(255, 2, 31, 54),
              children: [
                Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Offense",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
                const Divider(
                  color: Colors.white,
                ),

              SizedBox(
                height:300,
                width: double.maxFinite,
                child: ListView.builder(
                  
                  shrinkWrap: true,
                 
                  itemCount: fineList.length,
                  itemBuilder: (BuildContext context,int index){
              
                  return  CheckButton(
                    title: fineList[index].fineName,
                    value: fineList[index].checkFlag,
                    valFnc: (val){
                      myModel.changeCheckBoxVal(val);
                      if(val!){
                      myModel.addSelectedOffense(fineList[index].fineName);
                      
                      }else{
                        myModel.removeSelectedOffense(fineList[index].fineName);
                      }
                      fineList[index].checkFlag= myModel.checkBoxVal!;
                        log(myModel.selectedOffense.toString());
                    },
                    );
                }),
                
                

              ),
              Center(
                          child: ElevatedButton(
                              onPressed: () {
                                
                              Navigator.pop(context);
                              }, child: const Text("Next"))),
              

                // CheckButton()
                // Expanded(
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.stretch,
                //     children: [
                //       Column(
                //        children: [ ListView.builder(
                //           itemCount: fineList.length,
                //           itemBuilder: (BuildContext context, int index) {
                //             return const CheckButton();
                //           },
                //         ),],
                //       ),
                //       Center(
                //           child: ElevatedButton(
                //               onPressed: () {}, child: const Text("Next"))),
                //     ],
                //   ),
                // ),
              ]);
        }
      );
    },
  );
}

}
  extension StringConverter on List{
String listToString (){
    String value='';
    for (var element in this) { 
      value += "${element+","}";
    }
    return value;
}
  }