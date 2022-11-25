import 'package:flutter/material.dart';
import 'package:sidarth_new/Screens/User_Screens/DownloadRcandLc/licence.dart';
import 'package:sidarth_new/Screens/User_Screens/DownloadRcandLc/rc_book.dart';
import 'package:sidarth_new/Widgets/widgets.dart';

class DownLoadRcAndLc extends StatefulWidget {
  const DownLoadRcAndLc({super.key});

  @override
  State<DownLoadRcAndLc> createState() => _DownLoadRcAndLcState();
}

class _DownLoadRcAndLcState extends State<DownLoadRcAndLc>
    with SingleTickerProviderStateMixin {
  late TabController tabcontroller;

  @override
  void initState() {
    tabcontroller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: PreferredSize(
        preferredSize:const Size.fromHeight(60),
        child: AppBar12(title: "DownLoad Rc And Lc", autoAppbar: true),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          TabBar(
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.white,
              controller: tabcontroller,
              tabs:const [
                Tab(
                  text: "Rc Book",
                ),
                Tab(
                  text: "License",
                )
              ]),
          Expanded(
            child: TabBarView(
                controller: tabcontroller, children: [RcBook1(), Licence()]),
          )
        ],
      ),
    );
  }
}
