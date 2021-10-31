import 'package:flutter/material.dart';

class ScoreBox extends StatelessWidget {
  const ScoreBox({
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
