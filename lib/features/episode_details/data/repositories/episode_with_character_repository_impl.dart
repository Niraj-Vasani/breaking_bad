import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../series_episode_list/data/models/episode_model.dart';
import '../../../series_episode_list/domain/entities/episode_entity.dart';
import '../../domain/entities/character_entity.dart';
import '../../domain/repositories/episode_with_character_repository.dart';
import '../datasources/episode_with_character_datasource.dart';
import '../models/character_model.dart';

class EpisodeWithCharacterRepositoryImpl
    implements EpisodeWithCharacterRepository {
  final EpisodeWithCharacterDataSource episodeWithCharacterDataSource;

  EpisodeWithCharacterRepositoryImpl(
      {required this.episodeWithCharacterDataSource});

  @override
  Future<Either<Failure, CharacterEntity>> getCharacterByName(
      {required String characterName}) async {
    try {
      final CharacterModel character =
          await episodeWithCharacterDataSource.getCharacterByName(
        characterName: characterName,
      );
      return Right(character);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, EpisodeEntity>> getEpisodeById(
      {required String episodeId}) async {
    try {
      final EpisodeModel episode =
          await episodeWithCharacterDataSource.getEpisodeById(
        episodeId: episodeId,
      );
      return Right(episode);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<CharacterEntity>>> getCharactersByEpisode(
      {required String episodeId}) async {
    try {
      List<CharacterModel> filteredCharacterList = [];
      final episodeData = await getEpisodeById(episodeId: episodeId);

      await episodeData.fold(
        (failure) {
          debugPrint("Failed to get episode details");
        },
        (episode) async {
          final List<CharacterModel> allCharacterList =
              await episodeWithCharacterDataSource.getAllCharacte();

          filteredCharacterList = allCharacterList.where((character) {
            return episode.characters.contains(character.name);
          }).toList();
        },
      );

      return Right(filteredCharacterList);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }
}
