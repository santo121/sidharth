import 'package:flutter/material.dart';
import 'package:sidarth_new/Screens/User_Screens/Edit_Profile/edit_profile.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              padding: EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AccountText(text: "KL32b123"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.account_circle,
                          size: 70,
                        ),
                        Column(
                          children: [
                            AccountText(text: "Name"),
                            AccountText(text: "Address"),
                            AccountText(text: "04872632314")
                          ],
                        )
                      ],
                    ),
                  ])),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => EditUsrProfile(),
                ));
              },
              child: const Text("Edit profile")),
          ElevatedButton(onPressed: () {}, child: const Text("About us")),
          ElevatedButton(onPressed: () {}, child: const Text("Help")),
        ],
      ),
    );
  }
}

class AccountText extends StatelessWidget {
  AccountText({super.key, required this.text});

  String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
