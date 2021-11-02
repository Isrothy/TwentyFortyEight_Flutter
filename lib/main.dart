import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twenty_forty_eight/views/game_screen.dart';
import 'package:twenty_forty_eight/views/start_screen.dart';

import 'models/game_information.dart';

GameInformation gameInformation = GameInformation();

void main() {
  runApp(
    ChangeNotifierProvider(
      child: MaterialApp(
        title: '2048',
        initialRoute: '/',
        routes: {
          '/': (context) => StartScreen(
                gameInformation: gameInformation,
              ),
          '/game_screen': (context) => GameScreen(
                gameInformation: gameInformation,
              ),
        },
      ),
      create: (context) {
        GameInformationStorage storage = GameInformationStorage();
        storage
            .readGameInformation()
            .then((value) => {gameInformation = value!});
        return gameInformation;
      },
    ),
  );
}
