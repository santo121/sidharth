import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:sidarth_new/Functions/storage.dart';
import 'package:sidarth_new/Screens/Police_Screens/Fine%20AND%20SEMANCE/final_model_service.dart';
import 'package:sidarth_new/Widgets/widgets.dart';
class Fine extends StatefulWidget {
  const Fine({super.key,
  required this.userId,
  });
 final String userId;
  @override
State<Fine> createState() => _FineState();
}

class _FineState extends State<Fine> {

late UserFineService serviceModel ;

  final _razorpay = Razorpay();
  @override
  void initState() {
    super.initState();
    serviceModel = UserFineService(); 
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
_razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
_razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
  // Do something when payment succeeds
}

void _handlePaymentError(PaymentFailureResponse response) {
  // Do something when payment fails
}

void _handleExternalWallet(ExternalWalletResponse response) {
  // Do something when an external wallet is selected
}



void openCheckout(
  int amount,

) async {
    var options = {
      'key': 'rzp_test_hO0gujMeqHltNS',
      'amount': amount*100,
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '9539247551', 'email': 'sidharthrajcj@gmail.com'},
      'external': {
        'wallets': ['paytm','freecharge'],
        'cards':['mastercard']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

@override
void dispose() {
  super.dispose();
  _razorpay.clear();

}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: PreferredSize(
          child: AppBar12(title: "Fine and Summons", autoAppbar: false),
          preferredSize: Size.fromHeight(60)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Expanded(child: FutureBuilder(
              future: serviceModel.fineService(userId: widget.userId),
              builder: (context, snapshot){
                  if(snapshot.hasData){
                     return ListView.builder(
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      log(index.toString());
                  LocalStorage.setNotificationIndex(snapshot.data!.data!.length,);

                    final modelVal = snapshot.data!.data![index];

                      return finePayWidget(name:modelVal.name.toString() ,
                       regNum: modelVal.rcId.toString(),
                       offense: modelVal.offenseId.toString(),
                        amount: modelVal.amount.toString(),
                         typeOfTransfer: modelVal.mode.toString(),
                          onTap: (){ openCheckout(
                            modelVal.amount!=null?
                            
                            int.parse(modelVal.amount.toString()):00);});
                    },
                  );
                  }
                  else{
                    
                    return const Center(child: CircularProgressIndicator());
                  }
                  
              } ))
          //  acceptSummons()
            // Container(
            //   margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
            //   color: Colors.white,
            //   padding: const EdgeInsets.all(15),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       MyText2(name1: "Name:", width: 118, name2: "1"),
            //       MyText2(name1: "Reg No:", width: 110, name2: "1"),
            //       MyText2(name1: "Offense:", width: 110, name2: "1"),
            //       MyText2(name1: "Amount:", width: 110, name2: "1"),
            //       MyText2(name1: "Type of Transaction:", width: 35, name2: "1"),
            //     ],
            //   ),
            // ),
            // Container(
            //     margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
            //     color: Colors.blue,
            //     child: TextButton(
            //       onPressed: () {
            //         openCheckout();
            //       },
            //       child: const Text(
            //         "PAY FINE",
            //         style: TextStyle(color: Colors.white),
            //       ),
            //     )),
            
          ],
        ),
      ),
    );
  }


  Widget finePayWidget (
{required name,
required regNum,
required offense,
required amount,
required typeOfTransfer,
required onTap
}
  ){
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
                  margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  color: Colors.white,
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText2(name1: "Name", width: 118, name2: name),
                      MyText2(name1: "Rc number", width: 110, name2: regNum),
                      SingleChildScrollView( 
                        scrollDirection: Axis.horizontal,
                        child: MyText2(name1: "Offense", width: 110, name2: offense)),
                      MyText2(name1: "Amount", width: 110, name2: amount),
                      MyText2(name1: "Type of Transaction", width: 35, name2: typeOfTransfer),
                    ],
                  ),
                ),
                Container(
                margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                color: Colors.blue,
                child: TextButton(
                  onPressed:onTap,
                  //  () {
                  //   openCheckout();
                  // },
                  child: const Text(
                    "PAY FINE",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
      ],
    );
  }

  Widget acceptSummons(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
              margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
              color: Colors.white,
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText2(name1: "Name:", width: 118, name2: "1"),
                  MyText2(name1: "Reg No:", width: 110, name2: "1"),
                  MyText2(name1: "Offense", width: 110, name2: "1"),
                  MyText2(name1: "Amount", width: 110, name2: "1"),
                  MyText2(name1: "Download Semance", width: 35, name2: "1"),
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                color: Colors.blue,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "ACCEPET SEMANCE",
                    style: TextStyle(color: Colors.white),
                  ),
                ))
      ],
    );
  }
}
