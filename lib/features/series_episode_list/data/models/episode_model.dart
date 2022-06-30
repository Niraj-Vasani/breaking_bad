import '../../domain/entities/episode_entity.dart';

class EpisodeModel extends EpisodeEntity {
  const EpisodeModel({
    required super.episodeId,
    required super.title,
    required super.season,
    required super.airDate,
    required super.characters,
    required super.episode,
    required super.series,
  });

  factory EpisodeModel.fromJson(Map<String, dynamic> json) => EpisodeModel(
        episodeId: json["episode_id"],
        title: json["title"],
        season: json["season"],
        airDate: json["air_date"],
        characters: List<String>.from(json["characters"].map((x) => x)),
        episode: json["episode"],
        series: seriesValues.map[json["series"]]!,
      );
}
