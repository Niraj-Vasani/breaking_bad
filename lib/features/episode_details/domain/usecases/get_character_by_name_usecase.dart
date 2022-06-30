import '../repositories/episode_with_character_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/error.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/character_entity.dart';

class GetCharacterByNameUseCase
    implements UseCaseFuture<CharacterEntity, Params2> {
  final EpisodeWithCharacterRepository episodeWithCharacterRepository;

  GetCharacterByNameUseCase({required this.episodeWithCharacterRepository});

  @override
  Future<Either<Failure, CharacterEntity>> call(params) async {
    return await episodeWithCharacterRepository.getCharacterByName(
        characterName: params.characterName);
  }
}

class Params2 extends Equatable {
  final String characterName;

  const Params2({required this.characterName});

  @override
  List<Object?> get props => [characterName];
}
