import 'package:flutter/material.dart';
import 'package:sidarth_new/Screens/User_Screens/Contact_your_police_Station/police_station_address_model.dart';
import 'package:sidarth_new/Widgets/widgets.dart';

  // Map<String,PoliceStationAddress> policeStationAddress={
  //   'Athikad':PoliceStationAddress(contactNumber: '0487 2632314', policeStationName: 'Anthikad Police station', siName: 'Raju kumar')
  // };

List<PoliceStationAddress>policeStationAddress = 
[
PoliceStationAddress(contactNumber: '0487 2632314', policeStationName: 'Anthikad Police station', siName: 'Raju kumar'),
PoliceStationAddress(contactNumber: '0480 2632314', policeStationName: 'Irinjalkuda Police station', siName: 'Raju kumar'),
PoliceStationAddress(contactNumber: '0484 2632314', policeStationName: 'Thrissur Police station', siName: 'Raju kumar')
];
class ContactpoliceStation extends StatefulWidget {
  const ContactpoliceStation({super.key});

  @override
  State<ContactpoliceStation> createState() => _ContactpoliceStationState();
}

class _ContactpoliceStationState extends State<ContactpoliceStation> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar12(title: "Contact Police Station", autoAppbar: true),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                  onTap: () {
                    showSearch(context: context, delegate: MySearchOption());
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    color: Colors.white,
                    child: const Text("Search"),
                  ))
            ],
          ),
        ));
  }
}

class MySearchOption extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = [];
    return ListView.builder(
      itemCount: policeStationAddress.length,
      itemBuilder: (context, index) {
        final suggestion = policeStationAddress[index];
        return ListTile(
          title: Text(suggestion.policeStationName),
          onTap: () {
            query = suggestion.contactNumber;
            showResults(context);
          },
        );
      },
    );
  }
}
