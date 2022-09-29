import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sidarth_new/Screens/LoginScreens/User_login_Screen/OTP/otp.dart';
import 'package:sidarth_new/Widgets/widgets.dart';

class PhoneNumber extends StatefulWidget {
  PhoneNumber({super.key});

  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  String number = '0000000000';

  final phone = TextEditingController();

  bool isDataMatched = true;
  bool isLoading = true;

  final _fromkey = GlobalKey<FormState>();

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
                onPressed: () {
                  setState(() {
                    if (phone.text.isEmpty) {
                      isLoading = true;
                    } else if (number.length != phone.text.length) {
                      isLoading = true;
                    } else {
                      isLoading = false;
                    }
                    CheckLogin(context);
                    _fromkey.currentState!.validate();
                  });
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
        builder: (context) => OtpScreen(),
      ));
    }
  }
}
