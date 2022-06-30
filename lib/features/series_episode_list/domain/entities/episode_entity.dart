// To parse this JSON data, do
//
//     final episode = episodeFromMap(jsonString);

import 'package:equatable/equatable.dart';

class EpisodeEntity extends Equatable {
  final int episodeId;
  final String title;
  final String season;
  final String airDate;
  final List<String> characters;
  final String episode;
  final Series series;

  const EpisodeEntity({
    required this.episodeId,
    required this.title,
    required this.season,
    required this.airDate,
    required this.characters,
    required this.episode,
    required this.series,
  });

  @override
  List<Object?> get props => [episodeId, title, season, airDate, characters, series];
}

// ignore: constant_identifier_names
enum Series { BREAKING_BAD, BETTER_CALL_SAUL }

final seriesValues = EnumValues<Series>({
  "Better Call Saul": Series.BETTER_CALL_SAUL,
  "Breaking Bad": Series.BREAKING_BAD
});

class EnumValues<T> {
  Map<String, T> map;

  EnumValues(this.map);
}
