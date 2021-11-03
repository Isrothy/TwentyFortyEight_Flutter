// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameInformation _$GameInformationFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['bestScore'],
  );
  return GameInformation(
    bestScore: json['bestScore'] as int,
  );
}

Map<String, dynamic> _$GameInformationToJson(GameInformation instance) =>
    <String, dynamic>{
      'bestScore': instance.bestScore,
    };
