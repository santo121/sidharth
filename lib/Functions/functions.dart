import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sidarth_new/Screens/Police_Screens/Police_Transations/document_controller.dart';
import 'package:sidarth_new/Screens/Police_Screens/Rc_book/rc_book.dart';
import 'package:sidarth_new/Screens/AddminScreen/addmin_screen.dart';
import 'package:sidarth_new/Widgets/User_bottomNav/user_bottomnav.dart';
import 'package:sidarth_new/Widgets/police_bottomNav/bottomnav.dart';
import 'package:sidarth_new/Widgets/widgets.dart';

// pop Up Page//
@immutable
class FileAttachment extends StatelessWidget {
FileAttachment({super.key});

  Future pickImage({required context}) async {
    try {

      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

if(image == null) return;
final imageTemp = File(image.path);
Provider.of<DocumentController>(context,listen: false).changePickedFile(imageTemp);
final val= Provider.of<DocumentController>(context,listen: false).bools;
final pickedData= Provider.of<DocumentController>(context,listen: false).pickedDocument;

Provider.of<DocumentController>(context,listen: false).changeBool(
  pickedData.path.isEmpty?
  val?false:true:true);
                              // changeBool(myModel.bools?false:true);

// setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Consumer<DocumentController>(
                          builder: (context,myModel,ch) {
                                // log(myModel.pickedDocument.toString());
                                return
                        myModel.bools?Container(
                              color: Colors.black,
                              width: 50,height: 50,
                            child:Image.file(myModel.pickedDocument)
                            ):
                            const Text("summons Attach");}

                          //   if(myModel.pickedDocument==null)
                          //   {return 
                          //  else{
                          //   return
                              
                          //  }
                          
                          
                        ),
                        Consumer<DocumentController>(
                          builder: (context,myModel,ch) {
                            return IconButton(onPressed: (){
                              pickImage(context: context);
                              log("image taped");
                            }, icon:const Icon(Icons.add));
                          }
                        )
                      ],
                    ),
                   const SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: () {}, child: const Text("Send  Summons")),
            ],
          ),
        );
  }
}

Future<void> fineNotPaid(BuildContext context) async {
  showDialog(
    context: context,
    builder: (ctx) {
      return  SimpleDialog (children:[

       FileAttachment()
       
      ]);
    },
  );
}

// scan qr code//



// Splash Screen

Future<void> gotonextpage(BuildContext context1) async {
  await Future.delayed(const Duration(seconds: 2));
  Navigator.of(context1).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (ctx) => const AddminScreen(),
      ),
      (route) => false);
}

Future<void> checkLoin(BuildContext context) async {
  final login = await SharedPreferences.getInstance();
  bool? user = login.getBool("name");
  if (user == null || user == false) {
    gotonextpage(context);
  } else {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (ctx) => PoliceBottomNav(),
        ),
        (route) => false);
  }
}

Future<void> checkOtp(BuildContext context) async {
  final oTp = await SharedPreferences.getInstance();
  bool? otpUser = oTp.getBool("OTP");
  if (otpUser == null || otpUser == false) {
    gotonextpage(context);
  } else {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => UserBottomNav()), (route) => false);
  }
}



// Future<void> popUpPage1(BuildContext context) async {
//   showDialog(
//     context: context,
//     builder: (ctx) {
//       return SimpleDialog(
//           elevation: 20,
//           backgroundColor: const Color.fromARGB(255, 2, 31, 54),
//           children: [
//             Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const [
//                     Text(
//                       "Offense",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold),
//                     )
//                   ],
//                 )),
//             const Divider(
//               color: Colors.white,
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Column(
//                   children: [
//                     CheckButton(title: "Driving without insurance certificate"),
//                     CheckButton(title: "Driving without pollution certificate"),
//                     CheckButton(title: "Driving under influence of alcohol"),
//                     CheckButton(title: "Driving license"),
//                     CheckButton(title: "Not wearing seatbelt"),
//                     CheckButton(title: "Not wearing helmet")
//                   ],
//                 ),
//                 Center(
//                     child: ElevatedButton(
//                         onPressed: () {}, child: const Text("Next"))),
//               ],
//             ),
//           ]);
//     },
//   );
// }

Future<void> rcBook(BuildContext context) async {
  showDialog(
      context: context,
      builder: (ctx) {
        return SimpleDialog(elevation: 20, children: [
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyWidget2(
                    name: "KL5919213",
                    sacondNmae: "",
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  MyWidget2(name: "Owner Name :", width: 18, sacondNmae: "1"),
                  MyWidget2(name: "Reg Auth :", width: 40, sacondNmae: "1"),
                  MyWidget2(name: "Vec Class :", width: 36, sacondNmae: "1"),
                  MyWidget2(name: "Rc Status :", width: 37, sacondNmae: "1"),
                  MyWidget2(name: "Fuel Type :", width: 37, sacondNmae: "1"),
                  const Divider(color: Colors.black),
                  MyWidget2(
                      name: "Registration\nDate", width: 50, sacondNmae: "1"),
                  MyWidget2(
                      name: "Insurance Valid\nUpTo",
                      width: 25,
                      sacondNmae: "1"),
                  MyWidget2(
                      name: "Tax Valid\nUpTo", width: 60, sacondNmae: "1"),
                  MyWidget2(
                      name: "PUCC Valid\nUpTo", width: 48, sacondNmae: "1"),
                  Center(
                      child:
                          ElevatedButton(onPressed: () {}, child: Text("Save")))
                ],
              ),
            )
          ])
        ]);
      });
}

Future<void> license(BuildContext context) async {
  showDialog(
      context: context,
      builder: (ctx) {
        return SimpleDialog(elevation: 20, children: [
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyWidget2(
                    name: "KL5919213",
                    sacondNmae: "",
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  MyWidget2(name: "Owner Name :", width: 18, sacondNmae: "1"),
                  MyWidget2(name: "House name :", width: 40, sacondNmae: "1"),
                  MyWidget2(name: "Street :", width: 36, sacondNmae: "1"),
                  MyWidget2(name: "Pincode :", width: 37, sacondNmae: "1"),
                  MyWidget2(name: "District :", width: 37, sacondNmae: "1"),
                  MyWidget2(name: "DOB", width: 50, sacondNmae: "1"),
                  MyWidget2(name: "Valid form", width: 25, sacondNmae: "1"),
                  MyWidget2(name: "Valid to", width: 60, sacondNmae: "1"),
                  MyWidget2(name: "Vehicle class", width: 48, sacondNmae: "1"),
                  MyWidget2(
                      name: "Testing Authority", width: 48, sacondNmae: "1"),
                  Center(
                      child:
                          ElevatedButton(onPressed: () {}, child: Text("Save")))
                ],
              ),
            )
          ])
        ]);
      });
}
