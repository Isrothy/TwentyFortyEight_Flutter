import 'package:flutter/material.dart';

class ResetHighestScoreButton extends StatelessWidget {
  const ResetHighestScoreButton({
    required this.resetScore,
    Key? key,
  }) : super(key: key);

  final Function() resetScore;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: resetScore,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: const Text(
          "RESET HIGHEST SCORE",
          style: TextStyle(height: 1, fontSize: 30),
        ),
      ),
    );
  }
}