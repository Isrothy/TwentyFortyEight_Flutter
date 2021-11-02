import 'package:flutter/material.dart';

class GameEndView extends StatelessWidget {
  const GameEndView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double gameBoardViewSize = screenSize.width * 0.8;
    return Container(
      height: gameBoardViewSize,
      width: gameBoardViewSize,
      decoration: BoxDecoration(
        color: const Color(0x7fbbada0),
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
