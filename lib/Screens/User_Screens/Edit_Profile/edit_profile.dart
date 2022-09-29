import 'package:flutter/material.dart';
import 'package:sidarth_new/Widgets/widgets.dart';

class EditUsrProfile extends StatelessWidget {
  EditUsrProfile({super.key});

  ValueNotifier<List<String>> items = ValueNotifier(['Online', 'Offline']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primoryColor,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar12(title: "EDIT PROFILE", autoAppbar: false)),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text1(text: "User name"),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                      hintText: "User name",
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder()),
                ),
                Text1(text: "House name"),
                TextField(
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                      hintText: "House name",
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder()),
                ),
                Text1(text: "District"),
                TextField(
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                      hintText: "District",
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder()),
                ),
                Text1(text: "Pin number"),
                TextField(
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                      hintText: "Pin number",
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text1(text: "Phone number"),
                TextField(
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                      hintText: "Phone number",
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                        onPressed: () {}, child: const Text("Save Profile")),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
