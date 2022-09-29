import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sidarth_new/Screens/User_Screens/Usre_Home_Screen/user_home_screen.dart';
import 'package:sidarth_new/Widgets/User_bottomNav/user_bottomnav.dart';
import 'package:sidarth_new/Widgets/widgets.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String randomNumber = (10000 + Random().nextInt(99999 - 10000)).toString();

  final otpNumber = TextEditingController();

  final formkey = GlobalKey<FormState>();

  bool isMatched = true;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar12(title: "Penalty System", autoAppbar: false),
      ),
      body: Padding(
          padding: const EdgeInsets.all(35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(randomNumber,
                    style: const TextStyle(color: Colors.white, fontSize: 20)),
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                key: formkey,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: otpNumber,
                  decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "OTP",
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (isMatched) {
                      return null;
                    } else {
                      return "Enter Valid OTP";
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (otpNumber.text.isEmpty) {
                        isLoading = true;
                      } else if (otpNumber.text != randomNumber) {
                        isLoading = true;
                      } else {
                        isLoading = false;
                      }
                      checkOtp(context);
                      formkey.currentState!.validate();
                    });
                  },
                  child: isLoading
                      ? Text("OTP")
                      : const SpinKitThreeInOut(
                          duration: Duration(seconds: 5),
                          color: Colors.white,
                        )),
            ],
          )),
    );
  }

  void checkOtp(BuildContext context) async {
    if (randomNumber == otpNumber.text) {
      final oTp = await SharedPreferences.getInstance();
      await oTp.setBool("OTP", true);
      await Future.delayed(Duration(seconds: 5));
      Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => UserBottomNav(),
      ));
    } else if (randomNumber != otpNumber.text) {
      isMatched = false;
    } else if (otpNumber.text.isEmpty) {
      isMatched = false;
    }
  }
}
