import 'package:dartz/dartz.dart';

import '../../../../core/error/error.dart';
import '../entities/episode_entity.dart';

abstract class EpisodesRepository {
  Future<Either<Failure, List<EpisodeEntity>>> getListOfEpisodes(
      {required String seriesName});
}
