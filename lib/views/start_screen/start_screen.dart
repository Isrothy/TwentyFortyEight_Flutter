import 'package:flutter/material.dart';
import 'package:twenty_forty_eight/models/game_information.dart';
import 'package:twenty_forty_eight/views/start_screen/reset_highest_score_button.dart';
import 'package:twenty_forty_eight/views/start_screen/start_game_button.dart';


class StartScreen extends StatelessWidget {
  const StartScreen({
    required this.gameInformation,
    Key? key,
  }) : super(key: key);

  final GameInformation gameInformation;

  @override
  Widget build(BuildContext context) {
    void navigateToGameScreen() {
      Navigator.pushNamed(context, '/game_screen');
    }

    void resetScore() {
      gameInformation.setBestScore(0);
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
              ResetHighestScoreButton(
                resetScore: resetScore,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
