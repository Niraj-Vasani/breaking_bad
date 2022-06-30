import '../../domain/entities/character_entity.dart';

class CharacterModel extends CharacterEntity {
  const CharacterModel({
    required super.charId,
    required super.name,
    required super.birthday,
    required super.occupation,
    required super.img,
    required super.status,
    required super.nickname,
    required super.appearance,
    required super.portrayed,
    required super.category,
    required super.betterCallSaulAppearance,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        charId: json["char_id"],
        name: json["name"],
        birthday: json["birthday"] != null && json["birthday"] != "Unknown"
            ? json["birthday"]
            : "",
        occupation: List<String>.from(json["occupation"].map((x) => x)),
        img: json["img"],
        status: statusValues.map[json["status"]]!,
        nickname: json["nickname"],
        appearance: List<int>.from(json["appearance"].map((x) => x)),
        portrayed: json["portrayed"],
        category: json["category"],
        betterCallSaulAppearance:
            List<int>.from(json["better_call_saul_appearance"].map((x) => x)),
      );
}
