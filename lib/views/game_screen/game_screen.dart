import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twenty_forty_eight/models/direction.dart';
import 'package:twenty_forty_eight/models/game_board.dart';
import 'package:twenty_forty_eight/views/game_screen/new_game_button.dart';
import 'package:twenty_forty_eight/views/game_screen/score_box.dart';
import 'package:twenty_forty_eight/views/game_screen/twenty_forty_eight_image.dart';

import 'game_board_view.dart';

class GameScreen extends StatelessWidget {
  GameScreen({Key? key}) : super(key: key);

  final GameBoard gameBoard = GameBoard();

  void startGame() {
    gameBoard.reStart();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text("ENJOY THE GAME"),
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
                        NewGameButton(
                          onTap: () {
                            startGame();
                          },
                        ),
                      ],
                    )
                  ],
                ),
                GestureDetector(
                  onPanUpdate: (details) {
                    print("ww");
                    var delta = details.delta;
                    if (delta.dx.abs() < delta.dy.abs()) {
                      if (delta.dy < 0) {
                        gameBoard.swipe(direction: Direction.left);
                      } else {
                        gameBoard.swipe(direction: Direction.right);
                      }
                    } else {
                      if (delta.dx < 0) {
                        gameBoard.swipe(direction: Direction.down);
                      } else {
                        gameBoard.swipe(direction: Direction.up);
                      }
                    }
                  },
                  child: const GameBoardView(),
                )
              ],
            ),
          ),
        ),
      ),
      create: (context) {
        gameBoard.reStart();
        return gameBoard;
      },
    );
  }
}
