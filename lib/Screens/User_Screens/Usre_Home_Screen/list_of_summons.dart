import 'package:flutter/material.dart';
import 'package:sidarth_new/Screens/User_Screens/Usre_Home_Screen/list%20of%20summons%20service/user_summons_list.dart';
import 'package:sidarth_new/Widgets/widgets.dart';
import 'package:sidarth_new/cont_file.dart';

class SummonsList extends StatefulWidget {
 SummonsList({super.key,required this.rcId});
String rcId;
  @override
  State<SummonsList> createState() => _SummonsListState();
}

class _SummonsListState extends State<SummonsList> {
  UserSummonsListService rcSummons = UserSummonsListService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: PreferredSize(
          child: AppBar12(title: "Fine and Summons", autoAppbar: false),
          preferredSize: const Size.fromHeight(60)),
      body: FutureBuilder(
        future: rcSummons.getUserSummonsList(widget.rcId),//!
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.data!.length,
                itemBuilder: (context, index) {
                  final data = snapshot.data!.data!;
                  return acceptSummons(data[index].name.toString(),data[index].offenseId.toString());
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget acceptSummons(
    String name,
    String offense
  ) {
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
              MyText2(name1: "Name:  ", name2: name),
              Container(child: MyText2(name1: "Offense:  ",  name2: fineList[int.parse(offense.toString())].fineName)),
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
