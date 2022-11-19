import 'package:flutter/material.dart';
import 'package:sidarth_new/Screens/User_Screens/Usre_Home_Screen/list%20of%20summons%20service/user_summons_list.dart';
import 'package:sidarth_new/Widgets/widgets.dart';
import 'package:sidarth_new/cont_file.dart';

class SummonsList extends StatefulWidget {
  SummonsList({super.key, required this.rcId});
  String rcId;
  @override
  State<SummonsList> createState() => _SummonsListState();
}

class _SummonsListState extends State<SummonsList> {
  UserSummonsListService rcSummons = UserSummonsListService();
  List<int> selectedSummons=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: PreferredSize(
          child: AppBar12(title: "Fine and Summons", autoAppbar: false),
          preferredSize: const Size.fromHeight(60)),
      body: FutureBuilder(
        future: rcSummons.getUserSummonsList(widget.rcId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.data!.length,
                itemBuilder: (context, index) {
                  final data = snapshot.data!.data!;
                  // data[index].
                  return acceptSummons(data[index].name.toString(),
                      data[index].offenseId.toString(),
                    data[index].date.toString(),
                    data[index].phoneNumber.toString(),
                    data[index].rcId.toString(),
                    data[index].attachment.toString(),
                    (){
                      setState(() {
                        selectedSummons.add(index);
                      });
                    },index
                      );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget acceptSummons(String name, String offense, String date,
      String phoneNumber, String registerNumber, String file,onTap,int index) {
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
              MyText2(name1: "Name  ", name2: name),
              MyText2(name1: "date  ", name2: date),
              MyText2(name1: "Phone Number  ", name2: phoneNumber),
              MyText2(name1: "Register number  ", name2: registerNumber),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                      child: MyText2(name1: "Offense  ", name2: offense))),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: MyText2(name1: "File attached  ", name2: file)),
            ],
          ),
        ),
        Container(
            margin: const EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            color:selectedSummons.contains(index)?Colors.green: Colors.blue,
            child: TextButton(
              onPressed:onTap,
              child:Text(

                selectedSummons.contains(index)?
                "Accepted":'Accept Summons',
                style: TextStyle(color: Colors.white),
              ),
            ))
      ],
    );
  }
}
