import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_information.g.dart';

@JsonSerializable()
class GameInformation extends ChangeNotifier {

  @JsonKey(required: true)
  int _bestScore = 0;

  GameInformation();

  void setBestScore(int newValue) {
    _bestScore = newValue;
    notifyListeners();
  }

  int getBestScore() => _bestScore;

  factory GameInformation.fromJson(Map<String, dynamic> json) =>
      _$GameInformationFromJson(json);

  Map<String, dynamic> toJson() => _$GameInformationToJson(this);
}

class GameInformationStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;

    return File('$path/game_info.json');
  }

  Future<GameInformation?> readGameInformation() async {
    try {
      final file = await _localFile;

      final contents = await file.readAsString();
      
      Map<String, dynamic> map = jsonEncode(contents) as Map<String, dynamic>;
      
      return GameInformation.fromJson(map);
    } catch (e) {
      return null;
    }
  }

  Future<File> writeGameInformation(GameInformation gameInformation) async {
    final file = await _localFile;

    return file.writeAsString(jsonEncode(gameInformation));
  }
}
