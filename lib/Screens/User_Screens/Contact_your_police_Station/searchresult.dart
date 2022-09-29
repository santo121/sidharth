import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: const Color.fromARGB(241, 255, 255, 255),
                borderRadius: BorderRadius.circular(2)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Anthikad Police Station",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ProText(text: "Anthikad p.o"),
                  ProText(text: "680641"),
                  ProText(text: "04872632314"),
                  Row(
                    children: const [
                      Text(
                        "S i :",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Raju Kumar",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                  onPressed: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => EditPoliceProfile(),
                    // ));
                  },
                  child: const Text("Edit Profile")),
              ElevatedButton(onPressed: () {}, child: const Text("Help")),
              ElevatedButton(onPressed: () {}, child: const Text("About"))
            ],
          ),
        )
      ]),
    );
  }
}

class ProText extends StatelessWidget {
  ProText({super.key, required this.text});

  String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w300),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
