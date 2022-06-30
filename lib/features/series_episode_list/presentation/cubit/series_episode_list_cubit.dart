// ignore_for_file: constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:breaking_bad/features/series_episode_list/domain/entities/episode_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/error.dart';
import '../../domain/usecases/get_list_of_episodes_usecase.dart';

part 'series_episode_list_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class SeriesEpisodeListCubit extends Cubit<SeriesEpisodeListState> {
  final GetListOfEpisodesUseCase getListOfEpisodesUseCase;

  SeriesEpisodeListCubit({required this.getListOfEpisodesUseCase})
      : super(SeriesEpisodeListInitial());

  Future<void> getListOfEpisodes({required String seriesName}) async {
    emit(SeriesEpisodeListLoading());

    final Either<Failure, List<EpisodeEntity>> response =
        await getListOfEpisodesUseCase.call(Params(seriesName: seriesName));
    response.fold(
      (failure) {
        emit(SeriesEpisodeListError(message: _mapFailureToMessage(failure)));
      },
      (episodes) {
        Set<String> totalSeasonsSet = {};
        for (var episode in episodes) {
          totalSeasonsSet.add(episode.season.trim());
        }
        List<String> totalSeasons = totalSeasonsSet.toList();

        emit(SeriesEpisodeListLoaded(
            episodes: episodes, totalSeasons: totalSeasons));
      },
    );
  }
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case CacheFailure:
      return CACHE_FAILURE_MESSAGE;
    default:
      return 'Unexpected error';
  }
}
