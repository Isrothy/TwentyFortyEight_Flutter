import 'package:flutter_test/flutter_test.dart';
import 'package:twenty_forty_eight/models/game_information.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:json_annotation/json_annotation.dart';

Future<String> localPath() async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}


void main() {

  final path = localPath();

  File file = File('$path/game_info.json');


  test('file io', () {
    GameInformation gameInformation = GameInformation();
    GameInformationStorage gameInformationStorage = GameInformationStorage();
    gameInformationStorage.writeGameInformation(gameInformation);
  });

}
