import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twenty_forty_eight/models/game_board.dart';
import 'package:twenty_forty_eight/views/game_screen/new_game_button.dart';
import 'package:twenty_forty_eight/views/game_screen/score_box.dart';
import 'package:twenty_forty_eight/views/game_screen/twenty_forty_eight_image.dart';

import 'game_board_view.dart';

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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                            const ScoreBox(text: "BEST", score: 0),
                          ],
                        ),
                        const NewGameButton(),
                      ],
                    )
                  ],
                ),
                const GameBoardView(),
              ],
            ),
          ),
        ),
      ),
      create: (context) => gameBoard,
    );
  }
}
