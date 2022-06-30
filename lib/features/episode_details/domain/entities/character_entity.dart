// To parse this JSON data, do
//
//     final character = characterFromMap(jsonString);

// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

class CharacterEntity extends Equatable {
  const CharacterEntity({
    required this.charId,
    required this.name,
    required this.birthday,
    required this.occupation,
    required this.img,
    required this.status,
    required this.nickname,
    required this.appearance,
    required this.portrayed,
    required this.category,
    required this.betterCallSaulAppearance,
  });

  final int charId;
  final String name;
  final String birthday;
  final List<String> occupation;
  final String img;
  final Status status;
  final String nickname;
  final List<int> appearance;
  final String portrayed;
  final String category;
  final List<int> betterCallSaulAppearance;

  @override
  List<Object?> get props => [
        charId,
        name,
        birthday,
        occupation,
        img,
        status,
        nickname,
        appearance,
        portrayed,
        category,
        betterCallSaulAppearance,
      ];
}

enum Status { PRESUMED_DEAD, ALIVE, DECEASED, UNKNOWN }

final statusValues = EnumValues({
  "Alive": Status.ALIVE,
  "Deceased": Status.DECEASED,
  "Presumed dead": Status.PRESUMED_DEAD,
  "Unknown": Status.UNKNOWN
});

class EnumValues<T> {
  Map<String, T> map;

  EnumValues(this.map);
}
