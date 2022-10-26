import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidarth_new/Screens/Police_Screens/Fine%20Details/fine_controller.dart';
import 'package:sidarth_new/Screens/Police_Screens/Fine%20Details/offence_service.dart';
import 'package:sidarth_new/Screens/Police_Screens/Fine%20Details/offense_details_model.dart';
import 'package:sidarth_new/Widgets/police_bottomNav/bottomnav.dart';
import 'package:sidarth_new/Widgets/police_bottomNav/police_bottom_icons.dart';
import 'package:sidarth_new/Widgets/widgets.dart';
import '../../../cont_file.dart';
import 'fine_list_model_class.dart';
class FineDetails extends StatelessWidget {
  FineDetails({super.key, required this.vehicleNumber, required this.rcId});
  final String vehicleNumber;
  final String rcId;
   double? fineTotal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: PreferredSize(
          child: AppBar12(title: "Fine", autoAppbar: true),
          preferredSize: const Size.fromHeight(60)),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Consumer<FineController>(builder: (context, myModel, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Fine ",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                        hintText: vehicleNumber,
                        fillColor: Colors.white,
                        filled: true,
                        border: const OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    onChanged: (value) {
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
                        // myModel.changeOffense(val);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        color: Colors.white,
                        child: Consumer<FineController>(
                            builder: (context, myModel, child) {
                          return myModel.selectedOffense.isEmpty
                              ? const Text("Offense")
                              : Text(myModel.selectedOffense.listToString());
                        }),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      
                      myModel.changeAmount(value);
                    },
                    decoration:InputDecoration(
                        hintText: myModel.selectedOffense!=null?myModel.selectedOffense.calcFine().toString():"Amount",
                        fillColor: Colors.white,
                        filled: true,
                        border:const OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
                    onChanged: (value) {
                      myModel.changeAddress(value);
                    },
                    decoration: const InputDecoration(
                        hintText: "Address",
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.white,
                    child: DropButton(onTap: (item) {
                
                if (item == null) {
                  return;
                }
                myModel.changeModeOfFine(item);
                log(myModel.modeOfFine.toString());
                // selectedItem = item;
                // items.notifyListeners();
                
              },),
                    
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ValueListenableBuilder(
                          valueListenable: selectedIndex,
                          builder: (BuildContext ctx, int update, Widget? _) =>
                              ElevatedButton(
                                  onPressed: () {
                                    selectedIndex.value = 1;
                                    myModel.changeVehicleNumber(vehicleNumber);
                                    
                                    if (myModel.address != null &&
                                        myModel.amount != null &&
                                        myModel.mobileNumber != null &&
                                        myModel.name != null &&
                                        myModel.vehicleNumber != null &&
                                        myModel.modeOfFine != null &&
                                        myModel.selectedOffense.isNotEmpty) {
                                      OffenseModel sentFineToJson =
                                          OffenseModel(
                                              rcId: rcId,
                                              stationId: '1',
                                              address:
                                                  myModel.address.toString(),
                                              amount: myModel.amount.toString(),
                                              name: myModel.name.toString(),
                                              mobileNumber: myModel.mobileNumber
                                                  .toString(),
                                              modeOfPayment:
                                                  myModel.modeOfFine.toString(),
                                              selectedOffense:
                                                  myModel.selectedOffense,
                                              vehicleNumber: myModel
                                                  .vehicleNumber
                                                  .toString());

                                      // log("to json ${sentFineToJson.toJson().toString()}");
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //       builder: (context) =>
                                      //           PoliceBottomNav()),
                                      // );

                                      OffenseService service = OffenseService();
                                      service.sendFine(sentFineToJson).then((value){
                                        print(value);
                                        if(value==200){
                                           Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PoliceBottomNav()),
                                      );

                                        }
                                      });
                                    }
                                  },
                                  child: const Text("Send Fine")),
                        )
                      ])
                ],
              );
            }),
          )),
    );
  }

  popUpPage1(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) {
        return Consumer<FineController>(builder: (context, myModel, child) {
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
                  height: 300,
                  width: double.maxFinite,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: fineList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CheckButton(
                          title: fineList[index].fineName,
                          value: fineList[index].checkFlag,
                          valFnc: (val) {
                            myModel.changeCheckBoxVal(val);
                            if (val!) {
                              myModel
                                  .addSelectedOffense(FineIndex(index: index, offense: fineList[index].fineName));
                            } else {
                              myModel.removeSelectedOffense(
                                  FineIndex(index: index, offense: fineList[index].fineName));
                            }
                            fineList[index].checkFlag = myModel.checkBoxVal!;
                            log(myModel.selectedOffense.listToString().toString());
                          },
                        );
                      }),
                ),
                Center(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Next"))),

               
              ]);
        });
      },
    );
  }
}

extension StringConverter on List<FineIndex> {
  String listToString() {
    String value = '';
    for (var element in this) {
      
      value += "${element.offense} ,";
    }
    return value;
  }
}
extension FineCalc on List<FineIndex> {
  double calcFine() {
    double value =0;

    for (var element in this) {
      
    

    switch(element.index){
      case 0:
      value +=200;
      break;
      case 1:
      value += 500;
      break;
      case 2:
      value +=150.5;
      break;
      case 3:
      value +=800;
      break;
      case 4:
      value +=500;
      break;

    }
    }
    return value;
  }
}
