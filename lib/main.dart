import 'package:flutter/material.dart';
import 'package:twenty_forty_eight/views/game_screen.dart';
import 'package:twenty_forty_eight/views/start_screen.dart';

void main() {
  runApp(
    MaterialApp(
      title: '2048',
      initialRoute: '/',
      routes: {
        '/': (context) => const StartScreen(),
        '/game_screen': (context) => GameScreen(),
      },
    ),
  );
}
