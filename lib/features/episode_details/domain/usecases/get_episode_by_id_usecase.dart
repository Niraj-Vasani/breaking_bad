import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/error.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../series_episode_list/domain/entities/episode_entity.dart';
import '../repositories/episode_with_character_repository.dart';

class GetEpisodeByIdUseCase implements UseCaseFuture<EpisodeEntity, Params3> {
  final EpisodeWithCharacterRepository episodeWithCharacterRepository;

  GetEpisodeByIdUseCase({required this.episodeWithCharacterRepository});

  @override
  Future<Either<Failure, EpisodeEntity>> call(params) async {
    return await episodeWithCharacterRepository.getEpisodeById(
        episodeId: params.episodeId);
  }
}

class Params3 extends Equatable {
  final String episodeId;

  const Params3({required this.episodeId});

  @override
  List<Object?> get props => [episodeId];
}
