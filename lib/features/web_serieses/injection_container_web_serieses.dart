import 'package:get_it/get_it.dart';

import 'data/datasources/web_series_datasource.dart';
import 'data/repositories/web_serieses_repository_impl.dart';
import 'domain/repositories/web_series_repository.dart';
import 'domain/usecases/get_web_serieses_list_usecas.dart';
import 'presentation/cubit/web_serieses_cubit.dart';

final seriesesSL = GetIt.instance;

Future<void> init() async {
  // cubit
  seriesesSL.registerFactory<WebSeriesesCubit>(
    () => WebSeriesesCubit(
      getWebSeriesesListUseCase: seriesesSL.call(),
    ),
  );

  // usecase
  seriesesSL.registerLazySingleton<GetWebSeriesesListUseCase>(
    () => GetWebSeriesesListUseCase(
      seriesesSL.call(),
    ),
  );

  // repository
  seriesesSL.registerLazySingleton<WebSeriesesRepository>(
    () => WebSeriesesRepositoryImpl(
      seriesesSL.call(),
    ),
  );

  // datasource
  seriesesSL.registerLazySingleton<WebSeriesDataSource>(
    () => WebSeriesDataSourceImpl(),
  );
}
