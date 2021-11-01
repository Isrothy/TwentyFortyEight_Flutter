import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twenty_forty_eight/models/game_board.dart';
import 'package:twenty_forty_eight/views/game_screen/tile_view.dart';

class EmptyGameBoard extends StatelessWidget {
  const EmptyGameBoard({Key? key}) : super(key: key);

  static const backGroundColor = Color(0xFFbbada0);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: screenSize.width * 0.8,
      width: screenSize.width * 0.8,
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

class GameBoardView extends StatelessWidget {
  const GameBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double gameBoardViewSize = screenSize.width * 0.8;
    double spacingBetweenTiles = 10;
    double tileSize =
        (gameBoardViewSize - spacingBetweenTiles * (GameBoard.scale + 1)) /
            (GameBoard.scale);
    return Stack(
      children: [
        const EmptyGameBoard(),
        Consumer<GameBoard>(builder: (context, gameBoard, child) {
          List<Widget> tiles = <Widget>[];
          for (int i = 0; i < GameBoard.scale; ++i) {
            for (int j = 0; j < GameBoard.scale; ++j) {
              tiles.add(
                Positioned(
                  top: spacingBetweenTiles + i * tileSize,
                  left: spacingBetweenTiles + j * tileSize,
                  child: TileView(
                    value: gameBoard.getTile(i, j),
                  ),
                ),
              );
            }
          }
          return Stack(
            children: tiles,
          );
        }),
      ],
    );
  }
}
