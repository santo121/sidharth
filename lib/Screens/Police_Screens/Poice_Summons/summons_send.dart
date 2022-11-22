import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sidarth_new/Screens/Police_Screens/Poice_Summons/police_summons_model.dart';
import 'package:sidarth_new/Screens/Police_Screens/Poice_Summons/police_summons_service.dart';
import 'package:sidarth_new/Widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class SummonsSend extends StatelessWidget {
  SummonsSend({super.key});
  GetPoliceSummonsList getSummons = GetPoliceSummonsList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: SafeArea(
          child: FutureBuilder(
              future: getSummons.getPoliceSummonsList(),
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  return ListView.builder(
                      itemCount: snapShot.data!.data!.length,
                      itemBuilder: (context, index) {
                        final response = snapShot.data!.data;
                        if(response![index].attachment!=null){
                          log(response[index].attachment.toString());
                        return  sendSummonsWidget(response, index);
                        }
                        else
                        {return SizedBox();}
                        
                      });
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ));
  }

  Padding sendSummonsWidget(List<Data> response, int index)  {
    return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                        child: Column(children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Name : ${response[index].name}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Date : ${response[index].date}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,

                                  child: MyText2(
                                      name1: "RC id :",
                                      width: 90,
                                      name2: response[index].registernumber.toString()),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: MyText2(
                                      name1: "Offense :",
                                      width: 90,
                                      name2:
                                          response[index].offenseId.toString()),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: MyText2(
                                      name1: "Phone number",
                                      width: 53,
                                      name2: response[index]
                                          .phoneNumber
                                          .toString()),
                                ),
                                        //! changes
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: MyText2(
                                      name1: "Address",
                                      width: 53,
                                      name2: response[index]
                                          .address
                                          .toString()),
                                ),
                               TextButton(onPressed: (){
_launchUniversalLinkIos(Uri.parse('https://penalty.gitdr.com/public/${response[index].attachment}'));
                               }, child:const Text("Summons attachment")),
                                IconButton(
                                    onPressed: ()async {
                                      
                                        var url = Uri.parse("tel:${response[index].phoneNumber.toString()}");
                                        if (await canLaunchUrl(url)) {
                                          await launchUrl(url);
                                        } else {
                                          throw 'Could not launch $url';
                                        }
                                      
                                    },
                                    icon: const Icon(Icons.call))
                              ],
                            ),
                          ),
                        ]),
                        
                      );
  }

  Future<void> _launchInWebViewWithoutDomStorage(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(enableDomStorage: true),
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchUniversalLinkIos(Uri url) async {
    final bool nativeAppLaunchSucceeded = await launchUrl(
      url,
      mode: LaunchMode.externalNonBrowserApplication,
    );
    if (!nativeAppLaunchSucceeded) {
      await launchUrl(
        url,
        mode: LaunchMode.inAppWebView,
      );
    }
  }

}
