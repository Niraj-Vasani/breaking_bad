// ignore_for_file: constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:breaking_bad/features/episode_details/domain/entities/character_entity.dart';
import 'package:breaking_bad/features/series_episode_list/domain/entities/episode_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/error.dart';
import '../../domain/usecases/get_character_by_episode_usecase.dart';
import '../../domain/usecases/get_episode_by_id_usecase.dart';

part 'episode_details_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class EpisodeDetailsCubit extends Cubit<EpisodeDetailsState> {
  final GetEpisodeByIdUseCase getEpisodeByIdUseCase;
  final GetCharactersByEpisodeUseCase getCharactersByEpisodeUseCase;

  EpisodeDetailsCubit({
    required this.getEpisodeByIdUseCase,
    required this.getCharactersByEpisodeUseCase,
  }) : super(EpisodeDetailsInitial());

  Future<void> getEpisodeDataWithCharacter({required String episodeId}) async {
    emit(EpisodeDetailsLoading());

    final Either<Failure, EpisodeEntity> respons1 =
        await getEpisodeByIdUseCase.call(Params3(episodeId: episodeId));

    respons1.fold(
      (failure1) {
        emit(EpisodeDetailsError(message: _mapFailureToMessage(failure1)));
      },
      (episode) async {
        final Either<Failure, List<CharacterEntity>> response2 =
            await getCharactersByEpisodeUseCase
                .call(Params1(episodeId: episodeId));

        response2.fold(
          (failure2) {
            emit(EpisodeDetailsError(message: _mapFailureToMessage(failure2)));
          },
          (characterList) {
            emit(
              EpisodeDetailsLoaded(
                episodeDetails: episode,
                characterList: characterList,
              ),
            );
          },
        );
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
