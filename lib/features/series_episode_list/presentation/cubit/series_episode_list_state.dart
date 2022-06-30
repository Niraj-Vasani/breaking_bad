part of 'series_episode_list_cubit.dart';

abstract class SeriesEpisodeListState extends Equatable {
  const SeriesEpisodeListState();

  @override
  List<Object> get props => [];
}

class SeriesEpisodeListInitial extends SeriesEpisodeListState {}

class SeriesEpisodeListLoading extends SeriesEpisodeListState {}

class SeriesEpisodeListLoaded extends SeriesEpisodeListState {
  final List<EpisodeEntity> episodes;
  final List<String> totalSeasons;

  const SeriesEpisodeListLoaded({
    required this.episodes,
    required this.totalSeasons,
  });

  @override
  List<Object> get props => [episodes, totalSeasons];
}

class SeriesEpisodeListError extends SeriesEpisodeListState {
  final String message;

  const SeriesEpisodeListError({required this.message});

  @override
  List<Object> get props => [message];
}
