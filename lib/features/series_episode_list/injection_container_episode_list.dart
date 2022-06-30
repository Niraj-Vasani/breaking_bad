import 'package:get_it/get_it.dart';

import 'data/datasources/episodes_datasource.dart';
import 'data/repositories/episodes_repository_impl.dart';
import 'domain/repositories/episodes_repository.dart';
import 'domain/usecases/get_list_of_episodes_usecase.dart';
import 'presentation/cubit/series_episode_list_cubit.dart';

final episodeListSL = GetIt.instance;

Future<void> init() async {
  // cubit
  episodeListSL.registerFactory<SeriesEpisodeListCubit>(
    () => SeriesEpisodeListCubit(
      getListOfEpisodesUseCase: episodeListSL.call(),
    ),
  );

  // usecase
  episodeListSL.registerLazySingleton<GetListOfEpisodesUseCase>(
    () => GetListOfEpisodesUseCase(
      episodesRepository: episodeListSL.call(),
    ),
  );

  // repository
  episodeListSL.registerLazySingleton<EpisodesRepository>(
    () => EpisodesRepositoryImpl(
      episodesDataSource: episodeListSL.call(),
    ),
  );

  // datasource
  episodeListSL.registerLazySingleton<EpisodesDataSource>(
    () => EpisodesDataSourceImpl(),
  );
}
