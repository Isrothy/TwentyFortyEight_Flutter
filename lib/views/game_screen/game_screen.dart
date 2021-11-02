import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twenty_forty_eight/models/direction.dart';
import 'package:twenty_forty_eight/models/game_board.dart';
import 'package:twenty_forty_eight/models/game_information.dart';
import 'package:twenty_forty_eight/views/game_screen/new_game_button.dart';
import 'package:twenty_forty_eight/views/game_screen/score_box.dart';
import 'package:twenty_forty_eight/views/game_screen/twenty_forty_eight_image.dart';

import 'game_board_view.dart';

class GameScreen extends StatelessWidget {
  GameScreen({
    Key? key,
    required this.gameInformation,
  }) : super(key: key);

  final GameBoard gameBoard = GameBoard();

  final GameInformation gameInformation;

  static const gestureSensitive = 3;

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
                            Consumer<GameInformation>(
                              builder: (context, gameInformation, child) =>
                                  ScoreBox(
                                text: "BEST",
                                score: gameInformation.getBestScore(),
                              ),
                            )
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
                  onHorizontalDragEnd: (DragEndDetails details) {
                    if (details.primaryVelocity!.abs() < gestureSensitive) {
                      return;
                    }
                    bool succeed = false;
                    if (details.primaryVelocity! > 0) {
                      succeed = gameBoard.swipe(direction: Direction.right);
                    } else {
                      succeed = gameBoard.swipe(direction: Direction.left);
                    }
                    if (succeed) {
                      gameBoard.newRandomTile();
                      if (gameBoard.getScore() >
                          gameInformation.getBestScore()) {
                        gameInformation.setBestScore(gameBoard.getScore());
                      }
                    }
                  },

                  onVerticalDragEnd: (DragEndDetails details) {
                    if (details.primaryVelocity!.abs() < gestureSensitive) {
                      return;
                    }
                    bool succeed = false;
                    if (details.primaryVelocity! > 0) {
                      succeed = gameBoard.swipe(direction: Direction.down);
                    } else {
                      succeed = gameBoard.swipe(direction: Direction.up);
                    }
                    if (succeed) {
                      gameBoard.newRandomTile();
                      if (gameBoard.getScore() >
                          gameInformation.getBestScore()) {
                        gameInformation.setBestScore(gameBoard.getScore());
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
