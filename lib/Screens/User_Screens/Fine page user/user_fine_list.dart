// import 'package:flutter/material.dart';

// class UserFineList extends StatefulWidget {
//   const UserFineList({super.key});

//   @override
//   State<UserFineList> createState() => _UserFineListState();
// }

// class _UserFineListState extends State<UserFineList> {




//   final _razorpay = Razorpay();
//   @override
//   void initState() {
//     super.initState();
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
// _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
// _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

//   }

//   void _handlePaymentSuccess(PaymentSuccessResponse response) {
//   // Do something when payment succeeds
// }

// void _handlePaymentError(PaymentFailureResponse response) {
//   // Do something when payment fails
// }

// void _handleExternalWallet(ExternalWalletResponse response) {
//   // Do something when an external wallet is selected
// }



// void openCheckout() async {
//     var options = {
//       'key': 'rzp_test_hO0gujMeqHltNS',
//       'amount': 100,
//       'name': 'Acme Corp.',
//       'description': 'Fine T-Shirt',
//       'retry': {'enabled': true, 'max_count': 1},
//       'send_sms_hash': true,
//       'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
//       'external': {
//         'wallets': ['paytm','freecharge'],
//         'cards':['mastercard']
//       }
//     };

//     try {
//       _razorpay.open(options);
//     } catch (e) {
//       debugPrint('Error: $e');
//     }
//   }

// @override
// void dispose() {
//   super.dispose();
//   _razorpay.clear();

// }



//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }