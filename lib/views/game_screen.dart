import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twenty_forty_eight/models/game_board.dart';
import 'package:twenty_forty_eight/views/score_box.dart';
import 'package:twenty_forty_eight/views/twenty_forty_eight_image.dart';

class GameScreen extends StatelessWidget {
  GameScreen({Key? key}) : super(key: key);

  final GameBoard gameBoard = GameBoard();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text("enjoy the game"),
          ),
          body: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    const TwentyFortyEightImage(),
                    Column(
                      children: [
                        Row(
                          children: [
                            Consumer<GameBoard>(
                              builder: (context, gameBoard, child) => ScoreBox(
                                text: "SCORE",
                                score: gameBoard.getScore(),
                              ),
                            ),
                            const ScoreBox(text: "SCORE", score: 0),
                          ],
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      create: (context) => gameBoard,
    );
  }
}
