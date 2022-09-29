import 'package:flutter/material.dart';
import 'package:sidarth_new/Widgets/widgets.dart';

class ContactpoliceStation extends StatefulWidget {
  const ContactpoliceStation({super.key});

  @override
  State<ContactpoliceStation> createState() => _ContactpoliceStationState();
}

class _ContactpoliceStationState extends State<ContactpoliceStation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primoryColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
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
                    padding: EdgeInsets.all(20),
                    child: Text("Search"),
                    color: Colors.white,
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
          icon: Icon(Icons.clear))
    ];
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(query),
    );
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = [];
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            showResults(context);
          },
        );
      },
    );
    throw UnimplementedError();
  }
}
