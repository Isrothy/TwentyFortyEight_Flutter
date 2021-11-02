import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twenty_forty_eight/models/direction.dart';
import 'package:twenty_forty_eight/models/game_board.dart';
import 'package:twenty_forty_eight/models/game_information.dart';
import 'dart:math';

class _GameBoardViewSizeInformation {
  final double spaceBetweenTiles = 10;

  late final double width;
  late final double height;
  late final double tileSize;

  _GameBoardViewSizeInformation(context) {
    var screenSize = MediaQuery.of(context).size;

    width = min(screenSize.width, screenSize.height * 9 / 16) * 0.8;
    height = width;
    tileSize =
        (width - spaceBetweenTiles * (GameBoard.scale + 1)) / (GameBoard.scale);
  }
}

class _TileView extends StatelessWidget {
  const _TileView({
    required this.value,
    Key? key,
  }) : super(key: key);

  final int value;

  Color backgroundColor() {
    switch (value) {
      case 0:
        return const Color(0xFFccc0b3);
      case 2:
        return const Color(0xFFeee4da);
      case 4:
        return const Color(0xFFede0c8);
      case 8:
        return const Color(0xFFf59563);
      case 16:
        return const Color(0xFFf59563);
      case 32:
        return const Color(0xFFf67c5f);
      case 64:
        return const Color(0xFFf65e3b);
      case 128:
        return const Color(0xFFedcf72);
      case 256:
        return const Color(0xFFedcc61);
      case 512:
        return const Color(0xFFf9ca58);
      case 1024:
        return const Color(0xFFe3ba13);
      case 2048:
        return const Color(0xFFedc22e);
      case 4096:
        return const Color(0xFFf46674);
      case 8192:
        return const Color(0xFFf34b5d);
      case 16384:
        return const Color(0xFFea443c);
      case 32768:
        return const Color(0xFFec3f39);
      case 65536:
        return const Color(0xFF5ea2e3);
      case 131072:
        return const Color(0xFF017fc3);
      case 262144:
        return const Color(0xFF6c70c9);
      case 524288:
        return const Color(0xFF5b63c8);
      case 1048576:
        return const Color(0xFF3d53c9);
      case 2097152:
        return const Color(0xFF2844c8);
      default:
        return const Color(0xFF3f3f3f);
    }
  }

  Color foregroundColor() {
    switch (value) {
      case 2:
      case 4:
        return const Color(0xFF776e65);
      default:
        return Colors.white;
    }
  }

  double fontSize() {
    switch ((log(value) / ln10).floor()) {
      case 0:
        return 26;
      case 1:
        return 24;
      case 2:
        return 20;
      case 3:
        return 16;
      case 4:
        return 14;
      case 5:
        return 12;
      case 6:
        return 10;
      default:
        return 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    final sizeInfo = _GameBoardViewSizeInformation(context);
    return Container(
      width: sizeInfo.tileSize,
      height: sizeInfo.tileSize,
      decoration: BoxDecoration(
        color: backgroundColor(),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: value == 0
            ? const Text("")
            : Text(
                "$value",
                style: TextStyle(
                  fontSize: fontSize(),
                  color: foregroundColor(),
                ),
              ),
      ),
    );
  }
}

class _TwentyFortyEightImage extends StatelessWidget {
  const _TwentyFortyEightImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 180,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(12),
        shape: BoxShape.rectangle,
      ),
      child: const Center(
        child: Text(
          "2048",
          style: TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _NewGameButton extends StatelessWidget {
  const _NewGameButton({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onTap();
      },
      child: Container(
        height: 60,
        width: 153,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(12),
          shape: BoxShape.rectangle,
        ),
        child: const Center(
          child: Text(
            "NEW GAME",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class _ScoreBox extends StatelessWidget {
  const _ScoreBox({
    required this.text,
    required this.score,
    Key? key,
  }) : super(key: key);

  final String text;
  final int score;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 75,
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(12),
        shape: BoxShape.rectangle,
      ),
      child: Center(
        child: Text(
          "$text\n$score",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _GameEndView extends StatelessWidget {
  const _GameEndView({Key? key}) : super(key: key);

  static const backGroundColor = Color(0x7fbbada0);

  @override
  Widget build(BuildContext context) {
    final sizeInfo = _GameBoardViewSizeInformation(context);
    return Container(
      height: sizeInfo.height,
      width: sizeInfo.width,
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(12),
        shape: BoxShape.rectangle,
      ),
      child: const Center(
        child: Text(
          "GAME ENDS",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 50,
          ),
        ),
      ),
    );
  }
}

class _EmptyGameBoard extends StatelessWidget {
  const _EmptyGameBoard({Key? key}) : super(key: key);

  static const backGroundColor = Color(0xFFbbada0);

  @override
  Widget build(BuildContext context) {
    final sizeInfo = _GameBoardViewSizeInformation(context);
    return SizedBox(
      height: sizeInfo.height,
      width: sizeInfo.width,
      child: Container(
        decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.circular(12),
          shape: BoxShape.rectangle,
        ),
      ),
    );
  }
}

class _GameBoardView extends StatelessWidget {
  const _GameBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeInfo = _GameBoardViewSizeInformation(context);

    return Consumer<GameBoard>(
      builder: (context, gameBoard, child) {
        return Stack(
          children: [
            const _EmptyGameBoard(),
            for (int i = 0; i < GameBoard.scale; ++i)
              for (int j = 0; j < GameBoard.scale; ++j)
                Positioned(
                  top: (i + 1) * sizeInfo.spaceBetweenTiles +
                      i * sizeInfo.tileSize,
                  left: (j + 1) * sizeInfo.spaceBetweenTiles +
                      j * sizeInfo.tileSize,
                  child: _TileView(
                    value: gameBoard.getTile(i, j),
                  ),
                ),
          ],
        );
      },
    );
  }
}

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
                    const _TwentyFortyEightImage(),
                    Column(
                      children: [
                        Row(
                          children: [
                            Consumer<GameBoard>(
                              builder: (context, gameBoard, child) => _ScoreBox(
                                text: "SCORE",
                                score: gameBoard.getScore(),
                              ),
                            ),
                            Consumer<GameInformation>(
                              builder: (context, gameInformation, child) =>
                                  _ScoreBox(
                                text: "BEST",
                                score: gameInformation.getBestScore(),
                              ),
                            )
                          ],
                        ),
                        _NewGameButton(
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
                    if (gameBoard.operable() &&
                        details.primaryVelocity!.abs() < gestureSensitive) {
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
                    if (gameBoard.operable() &&
                        details.primaryVelocity!.abs() < gestureSensitive) {
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
                  child: Consumer<GameBoard>(
                    builder: (context, gameBoard, child) => Stack(
                      children: [
                        const _GameBoardView(),
                        if (!gameBoard.operable()) const _GameEndView(),
                      ],
                    ),
                  ),
                ),
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
