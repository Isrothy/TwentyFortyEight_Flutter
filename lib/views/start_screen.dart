import 'package:flutter/material.dart';
import 'package:twenty_forty_eight/models/game_information.dart';

class _StartGameButton extends StatelessWidget {
  const _StartGameButton({
    required this.startGame,
    Key? key,
  }) : super(key: key);

  final Function() startGame;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: startGame,
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

class _ResetHighestScoreButton extends StatelessWidget {
  const _ResetHighestScoreButton({
    required this.resetScore,
    Key? key,
  }) : super(key: key);

  final Function() resetScore;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: resetScore,
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
  const StartScreen({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    void navigateToGameScreen() {
      Navigator.pushNamed(context, '/game_screen');
    }

    void resetScore() {
      setBestScore(0);
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
              _StartGameButton(
                startGame: navigateToGameScreen,
              ),
              const SizedBox(
                height: 20,
              ),
              _ResetHighestScoreButton(
                resetScore: resetScore,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
