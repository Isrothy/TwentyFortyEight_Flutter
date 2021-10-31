import 'package:flutter/material.dart';

class ResetHighestScoreButton extends StatelessWidget {
  const ResetHighestScoreButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
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