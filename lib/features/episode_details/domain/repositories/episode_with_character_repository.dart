import '../entities/character_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/error.dart';
import '../../../series_episode_list/domain/entities/episode_entity.dart';

abstract class EpisodeWithCharacterRepository {
  Future<Either<Failure, EpisodeEntity>> getEpisodeById(
      {required String episodeId});

  Future<Either<Failure, CharacterEntity>> getCharacterByName(
      {required String characterName});

  Future<Either<Failure, List<CharacterEntity>>> getCharactersByEpisode(
      {required String episodeId});
}
