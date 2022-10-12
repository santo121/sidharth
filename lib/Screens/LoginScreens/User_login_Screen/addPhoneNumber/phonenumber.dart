import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sidarth_new/Screens/LoginScreens/User_login_Screen/OTP/otp.dart';
import 'package:sidarth_new/Widgets/widgets.dart';

class PhoneNumber extends StatefulWidget {
  PhoneNumber({super.key});
// final FirebaseUser user;


  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  String number = '0000000000';

Future<void> initializeDefault() async {
    FirebaseApp app = await Firebase.initializeApp(
      
    );
    print('Initialized default app $app');
  }
  final phone = TextEditingController();

  bool isDataMatched = true;
  bool isLoading = true;

  final _fromkey = GlobalKey<FormState>();

@override
void initState() {
  super.initState();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar12(title: "Penalty System", autoAppbar: false),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 20,
            ),
            Form(
              key: _fromkey,
              child: TextFormField(
                controller: phone,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Mobile Number",
                    border: OutlineInputBorder()),
                validator: (_) {
                  if (phone.text.isEmpty == !isDataMatched) {
                    return null;
                  } else {
                    return "Enter valid Phone Number";
                  }
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: (){
                  setState(() {
                    if (phone.text.isEmpty) {
                      isLoading = true;
                    } else if (number.length != phone.text.length) {
                      isLoading = true;
                    } else {
                      isLoading = false;
                    }
                  // verifyPhoneNum();
                    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => OtpScreen(phoneNum: phone.value.text),
      ));
                    // CheckLogin(context);
                    _fromkey.currentState!.validate();

                  },
                  );

                },
                child: isLoading
                    ? const Text("Sent")
                    : const SpinKitThreeInOut(
                        duration: Duration(seconds: 5),
                        color: Colors.white,
                      )),
          ],
        ),
      ),
    );
  }

  void CheckLogin(BuildContext context) async {
    if (number.length == phone.text.length) {
      await Future.delayed(Duration(seconds: 5));
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => OtpScreen(phoneNum: phone.value.text),
      ));
    }
  }

  Future<void> verifyPhoneNum()async{
  await Firebase.initializeApp();
    
await FirebaseAuth.instance.verifyPhoneNumber(
  phoneNumber:"+91${phone.text}" ,
  verificationCompleted:(PhoneAuthCredential val)async{
    print(val.smsCode.toString());
    await FirebaseAuth.instance.signInWithCredential(val);
    }, 
   verificationFailed: (FirebaseAuthException e) {
          final snackBar = SnackBar(content: Text("${e.message}"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
 codeSent: (verficationId,resendToken) {
          // setState(() {
          //   codeSent = true;
          //   verId = verficationId;
          // });
        },
  codeAutoRetrievalTimeout: (String verificationId) {
          // setState(() {
          //   verId = verificationId;
          // });
        },
        timeout: Duration(seconds: 60));
  }

  
}
