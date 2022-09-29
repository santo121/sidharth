import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidarth_new/Functions/functions.dart';
import 'package:sidarth_new/Screens/Police_Screens/Fine%20Details/fine_controller.dart';
import 'package:sidarth_new/Widgets/widgets.dart';

class FineDetails extends StatelessWidget {

  const FineDetails({super.key,required this.vehicleNumber});
 final String vehicleNumber;

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: PreferredSize(
          child: AppBar12(title: "Fine", autoAppbar: true),
          preferredSize:const Size.fromHeight(60)),
      body: Padding(
          padding:const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child:Consumer<FineController>(
              builder: (context,myModel,child) {
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
                          border:const OutlineInputBorder()),
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
                        },
                        child: Container(
                          padding:const EdgeInsets.all(20),
                          color: Colors.white,
                          child:const Text("Offense"),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                      },
                      decoration: const InputDecoration(
                          hintText: "Amount",
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      onChanged: (value) {
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
                      child: DropButton(),
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
                        ElevatedButton(
                            onPressed: () {
                            },
                            child:const Text("Send Fine")),
                      ],
                    )
                  ],
                );
              }
            ),
          )),
    );
  }

  


  }

