part of 'episode_details_cubit.dart';

abstract class EpisodeDetailsState extends Equatable {
  const EpisodeDetailsState();

  @override
  List<Object> get props => [];
}

class EpisodeDetailsInitial extends EpisodeDetailsState {}

class EpisodeDetailsLoading extends EpisodeDetailsState {}

class EpisodeDetailsLoaded extends EpisodeDetailsState {
  final EpisodeEntity episodeDetails;
  final List<CharacterEntity> characterList;

  const EpisodeDetailsLoaded({
    required this.episodeDetails,
    required this.characterList,
  });

  @override
  List<Object> get props => [episodeDetails, characterList];
}

class EpisodeDetailsError extends EpisodeDetailsState {
  final String message;

  const EpisodeDetailsError({required this.message});

  @override
  List<Object> get props => [message];
}
