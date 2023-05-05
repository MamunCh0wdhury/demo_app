
import 'package:flutter/material.dart';
import 'package:profanity_filter/profanity_filter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final filter = ProfanityFilter();
  bool isProfane = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bad Word Detector"),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            onChanged: (text) {
              setState(() {
                isProfane = filter.hasProfanity(text);
              });
            },
            decoration: InputDecoration(
              hintText: 'Type something...',
              errorText: isProfane ? 'Text contains bad words' : null,
            ),
          ),
        ),
      ]),
    );
  }
}
