import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/episode_entity.dart';
import '../repositories/episodes_repository.dart';

class GetListOfEpisodesUseCase
    implements UseCaseFuture<List<EpisodeEntity>, Params> {
  final EpisodesRepository episodesRepository;

  GetListOfEpisodesUseCase({required this.episodesRepository});

  @override
  Future<Either<Failure, List<EpisodeEntity>>> call(params) async {
    return await episodesRepository.getListOfEpisodes(
        seriesName: params.seriesName);
  }
}

class Params extends Equatable {
  final String seriesName;

  const Params({required this.seriesName});

  @override
  List<Object?> get props => [seriesName];
}
