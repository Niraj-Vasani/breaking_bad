import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/error.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/character_entity.dart';
import '../repositories/episode_with_character_repository.dart';

class GetCharactersByEpisodeUseCase
    implements UseCaseFuture<List<CharacterEntity>, Params1> {
  final EpisodeWithCharacterRepository episodeWithCharacterRepository;

  GetCharactersByEpisodeUseCase({required this.episodeWithCharacterRepository});

  @override
  Future<Either<Failure, List<CharacterEntity>>> call(params) async {
    return await episodeWithCharacterRepository.getCharactersByEpisode(
        episodeId: params.episodeId);
  }
}

class Params1 extends Equatable {
  final String episodeId;

  const Params1({required this.episodeId});

  @override
  List<Object?> get props => [episodeId];
}
