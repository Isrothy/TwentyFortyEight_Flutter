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

class ResetHighestScoreButton extends StatelessWidget {
  const ResetHighestScoreButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Container(
        padding: const EdgeInsets.all(10),
        child: const Text(
          "RESET HIGHEST SCORE",
          style: TextStyle(height: 1, fontSize: 30),
        ),
      ),
    );
  }
}

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void navigateToGameScreen() {
      Navigator.pushNamed(context, '/game_screen');
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("welcome to 2048"),
        ),
        body: Center(
          child: Column(
            children: [
              const Text(
                "2048",
                style: TextStyle(
                  height: 3,
                  fontSize: 90,
                ),
              ),
              StartGameButton(
                startGame: navigateToGameScreen,
              ),
              const SizedBox(
                height: 20,
              ),
              const ResetHighestScoreButton(),
            ],
          ),
        ),
      ),
    );
  }
}
