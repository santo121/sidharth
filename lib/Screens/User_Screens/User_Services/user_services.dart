import 'package:flutter/material.dart';
import 'package:sidarth_new/Widgets/widgets.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primoryColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar12(title: "Services", autoAppbar: true)),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ServicesStack(
                title: "Nearest polluution\nChecking center",
                image: "Image/pollution checking (1).jpg",
                function: () {}),
            ServicesStack(
                title: "Nearest Hospital",
                image: "Image/istockphoto-1300273646-612x612.jpg",
                function: () {}),
            ServicesStack(
              title: "Nearest RTO",
              image: "Image/istockphoto-1064071730-170667a.jpg",
              function: () {},
            )
          ],
        ),
      ),
    );
  }
}

class ServicesText extends StatelessWidget {
  ServicesText({super.key, required this.text});

  String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class ServicesStack extends StatelessWidget {
  ServicesStack(
      {super.key,
      required this.title,
      required this.image,
      required this.function});

  String title;
  String image;
  Function function;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ServicesText(text: title),
              SizedBox(height: 60, child: Image.asset(image))
            ],
          ),
        ),
        Positioned(
          bottom: 1,
          right: 30,
          child: GestureDetector(
            onTap: () {
              function();
            },
            child: Container(
              padding: EdgeInsets.only(left: 40, right: 40, top: 8, bottom: 8),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                "Search",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
// 