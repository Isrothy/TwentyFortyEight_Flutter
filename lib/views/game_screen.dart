import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("enjoy the game"),
        ),
        body: Center(
          child: Column(
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
