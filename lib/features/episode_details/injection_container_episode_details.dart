import 'presentation/cubit/episode_details_cubit.dart';
import 'package:get_it/get_it.dart';

import 'data/datasources/episode_with_character_datasource.dart';
import 'data/repositories/episode_with_character_repository_impl.dart';
import 'domain/repositories/episode_with_character_repository.dart';
import 'domain/usecases/get_character_by_episode_usecase.dart';
import 'domain/usecases/get_character_by_name_usecase.dart';
import 'domain/usecases/get_episode_by_id_usecase.dart';

final episodeDataSL = GetIt.instance;

Future<void> init() async {
  // cubit
  episodeDataSL.registerFactory<EpisodeDetailsCubit>(
    () => EpisodeDetailsCubit(
        getCharactersByEpisodeUseCase: episodeDataSL.call(),
        getEpisodeByIdUseCase: episodeDataSL.call()),
  );

  // usecase
  episodeDataSL.registerLazySingleton<GetCharactersByEpisodeUseCase>(
    () => GetCharactersByEpisodeUseCase(
      episodeWithCharacterRepository: episodeDataSL.call(),
    ),
  );

  episodeDataSL.registerLazySingleton<GetCharacterByNameUseCase>(
    () => GetCharacterByNameUseCase(
      episodeWithCharacterRepository: episodeDataSL.call(),
    ),
  );

  episodeDataSL.registerLazySingleton<GetEpisodeByIdUseCase>(
    () => GetEpisodeByIdUseCase(
      episodeWithCharacterRepository: episodeDataSL.call(),
    ),
  );

  // repository
  episodeDataSL.registerLazySingleton<EpisodeWithCharacterRepository>(
    () => EpisodeWithCharacterRepositoryImpl(
      episodeWithCharacterDataSource: episodeDataSL.call(),
    ),
  );

  // datasource
  episodeDataSL.registerLazySingleton<EpisodeWithCharacterDataSource>(
    () => EpisodeWithCharacterDataSourceImpl(),
  );
}
