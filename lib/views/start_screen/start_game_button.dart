import 'package:flutter/material.dart';

class StartGameButton extends StatelessWidget {
  const StartGameButton({
    required this.startGame,
    Key? key,
  }) : super(key: key);

  final Function() startGame;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        startGame();
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: const Text(
          "NEW GAME",
          style: TextStyle(height: 1, fontSize: 30),
        ),
      ),
    );
  }
}