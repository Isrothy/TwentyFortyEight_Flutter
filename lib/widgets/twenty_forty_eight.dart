import 'package:flutter/material.dart';

class StartGameButton extends StatelessWidget {
  const StartGameButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Container(
        child: const Text("NEW GAME"),
        decoration: const BoxDecoration(),
      ),
    );
  }
}

class TwentyFortyEight extends StatelessWidget {
  const TwentyFortyEight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "2048",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("welcome to 2048"),
        ),
        body: Center(
          child: Column(
            children: const [
              Text(
                "2048",
                style: TextStyle(height: 3, fontSize: 90),
              ),
              StartGameButton(),
            ],
          ),
        ),
      ),
    );
  }
}
