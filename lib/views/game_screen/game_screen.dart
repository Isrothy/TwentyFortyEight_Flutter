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
                  onHorizontalDragEnd: (DragEndDetails details) {
                    bool succeed = false;
                    if(details.primaryVelocity! > 0) {
                      // print("right");
                      succeed = gameBoard.swipe(direction: Direction.right);
                    } else {
                      // print("left");
                      succeed = gameBoard.swipe(direction: Direction.left);
                    }
                    if (succeed) {
                      gameBoard.newRandomTile();
                    }
                  },
                  onVerticalDragEnd: (DragEndDetails details) {
                    bool succeed = false;
                    if(details.primaryVelocity! > 0) {
                      // print("up");
                      succeed = gameBoard.swipe(direction: Direction.down);
                    } else {
                      // print("down");
                      succeed = gameBoard.swipe(direction: Direction.up);
                    }
                    if (succeed) {
                      gameBoard.newRandomTile();
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
