import 'package:breaking_bad/features/episode_details/injection_container_episode_details.dart'
    as episode_details_sl;
import 'package:breaking_bad/features/series_episode_list/injection_container_episode_list.dart'
    as episode_list_sl;
import 'package:breaking_bad/features/splash/injection_container_splash.dart'
    as splash_sl;
import 'package:breaking_bad/features/web_serieses/injection_container_web_serieses.dart'
    as serieses_sl;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/constants/constants.dart';
import 'core/utils/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await splash_sl.init();
  await serieses_sl.init();
  await episode_list_sl.init();
  await episode_details_sl.init();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  ));

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.grey[900],
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.grey[900],
      ),
    );

    return MaterialApp(
      title: StringConst.sAppName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.yellow[600],
        indicatorColor: Colors.yellow[600],
        splashColor: Colors.yellow[600],
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: Colors.yellow[600],
        ),
        tabBarTheme: TabBarTheme(
          overlayColor: MaterialStateColor.resolveWith(
              (states) => Colors.yellow.shade600),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.grey.shade800,
          secondary: Colors.yellow.shade600,
        ),
      ),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AppRouter.spash,
    );
  }
}
