import 'package:flutter/material.dart';

typedef NewGameButtonCallBack = void Function();

class NewGameButton extends StatelessWidget {
  const NewGameButton({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final NewGameButtonCallBack onTap;

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
