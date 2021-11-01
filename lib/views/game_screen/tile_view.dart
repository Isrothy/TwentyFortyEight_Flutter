import 'package:flutter/material.dart';
import 'dart:math';

import 'package:twenty_forty_eight/models/game_board.dart';

class TileView extends StatelessWidget {
  const TileView({
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
    var screenSize = MediaQuery.of(context).size;
    double gameBoardViewSize = screenSize.width * 0.8;
    double spacingBetweenTiles = 10;
    double tileSize =
        (gameBoardViewSize - spacingBetweenTiles * (GameBoard.scale + 1)) /
            (GameBoard.scale);
    return Container(
      width: tileSize,
      height: tileSize,
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
