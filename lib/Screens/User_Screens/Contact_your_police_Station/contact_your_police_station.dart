import 'package:flutter/material.dart';
import 'package:sidarth_new/Screens/User_Screens/Contact_your_police_Station/police_station_address_model.dart';
import 'package:sidarth_new/Widgets/widgets.dart';

  // Map<String,PoliceStationAddress> policeStationAddress={
  //   'Athikad':PoliceStationAddress(contactNumber: '0487 2632314', policeStationName: 'Anthikad Police station', siName: 'Raju kumar')
  // };

List<PoliceStationAddress>policeStationAddress = 
[
PoliceStationAddress(contactNumber: '0487 2632314', policeStationName: 'Anthikad Police station', siName: 'Raju kumar',address: "Anthikad police station\n\nAddress:Po anthikad,\n\n680641,Si name: raju kumar,\n\nPhone number: :9539247551"),
PoliceStationAddress(contactNumber: '0480 2632314', policeStationName: 'Thrissur Police station', siName: 'Raju kumar',address: 'Thrissur police station\n\nAddress:Po Thrissur, 630621,\n\nSi name: babu raj,\n\nPhone number:9048545356'),
PoliceStationAddress(contactNumber: '0484 2632314', policeStationName: 'chavakkadPolice station', siName: 'Raju kumar',address: "chavakkad police station\n\nAddress:Po chavakkad, 620610,\n\nSi name: ashiq usmaan,\n\nPhone number:9954377213")
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
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(color: Color.fromARGB(255, 216, 216, 216),),
      margin: EdgeInsets.all(30),
      child: Row(
        children: [
         Text(query),
        
        ],
      ),
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
            query = suggestion.address;
            showResults(context);
          },
        );
      },
    );
  }
}
