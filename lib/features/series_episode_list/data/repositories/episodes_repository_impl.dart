import 'package:dartz/dartz.dart';

import '../../../../core/error/error.dart';
import '../../domain/entities/episode_entity.dart';
import '../../domain/repositories/episodes_repository.dart';
import '../datasources/episodes_datasource.dart';

class EpisodesRepositoryImpl implements EpisodesRepository {
  final EpisodesDataSource episodesDataSource;

  EpisodesRepositoryImpl({required this.episodesDataSource});

  @override
  Future<Either<Failure, List<EpisodeEntity>>> getListOfEpisodes(
      {required String seriesName}) async {
    try {
      final listOfEpisodes =
          await episodesDataSource.getListOfEpisodes(seriesName: seriesName);
      return Right(listOfEpisodes);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }
}
