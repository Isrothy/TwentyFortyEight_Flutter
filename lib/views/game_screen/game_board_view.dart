import 'package:flutter/material.dart';

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
    return Stack(
      children: const [
        EmptyGameBoard(),
      ],
    );
  }
}
