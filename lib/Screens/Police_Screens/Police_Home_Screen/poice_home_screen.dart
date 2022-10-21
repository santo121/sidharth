import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:sidarth_new/Functions/functions.dart';
import 'package:sidarth_new/Screens/Police_Screens/Police_Home_Screen/police_qrcode_scanner.dart';
import 'package:sidarth_new/Screens/Police_Screens/Police_Home_Screen/qrcode_service.dart';
import 'package:sidarth_new/Screens/Police_Screens/Rc_book/rc_book.dart';

class PoliceHomeScreen extends StatelessWidget {
  PoliceHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            child: Image.asset("Image/IMG_20220928_155138.png"),
          ),
          SizedBox(
            height: 20,
          ),
          Consumer<PoliceQrCodeController>(builder: (context, myModel, child) {
            return Center(
              child: ElevatedButton(
                  onPressed: () async {
                    QrCodeService qrService = QrCodeService();
                    await FlutterBarcodeScanner.scanBarcode(
                            "#000000", "Cancel", true, ScanMode.BARCODE)
                        .then((value) async {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //       builder: (context) => RcBook(
                      //         fuelType: "",
                      //         insuranceVal: '',
                      //         ownerName: '',
                      //         pollutionVal: '',
                      //         rcStatus: '',
                      //         registrationDate: '',
                      //         reqAuth: '',
                      //         taxVal: '',
                      //         vecClass: '',
                      //       ),
                      //     ));

                      await qrService
                          .qrCodeScannerService(url: value)
                          .then((value) {
                        final data = value.data![0];
                        if (value.data == "No data Found") {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Qr code is not valid"),
                          ));
                        } else {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RcBook(
                              rcNum: data.rcId.toString(),
                              fuelType: 'petrol',
                              insuranceVal: data.insurancevalidupto.toString(),
                              ownerName: 'Stefin',
                              pollutionVal: data.pollutionvalidupto.toString(),
                              rcStatus: data.rcStatus,
                              registrationDate:data.registrationdate,
                              reqAuth: "Thrissur",
                              taxVal: data.taxvalidupto.toString(),
                              vecClass: 'Four wheeler',
                              vehicleNumber: data.registernumber,
                            ),
                          ));
                        }
                      });
                      log(value);
                      myModel.changeScannerVal(value);
                    });
                  },
                  child: const Text("Scan Vehicle Rc")),
            );
          }),
        ],
      ),
    );
  }
}
