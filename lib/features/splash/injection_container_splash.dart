import 'package:get_it/get_it.dart';

import 'presentation/cubit/splash_cubit.dart';

final splashSL = GetIt.instance;

Future<void> init() async {
  // cubit
  splashSL.registerFactory<SplashCubit>(
    () => SplashCubit(),
  );
}
