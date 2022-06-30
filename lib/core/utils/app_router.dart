import '../../features/episode_details/presentation/pages/episode_details_page.dart';
import '../../features/series_episode_list/presentation/pages/episode_list_page.dart';

import '../../features/episode_details/presentation/cubit/episode_details_cubit.dart';
import '../../features/series_episode_list/presentation/cubit/series_episode_list_cubit.dart';

import '../constants/constants.dart';
import '../../features/web_serieses/presentation/cubit/web_serieses_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/splash/presentation/cubit/splash_cubit.dart';
import '../../features/splash/presentation/pages/splash.dart';
import '../../features/web_serieses/presentation/pages/web_serieses_page.dart';
import 'package:breaking_bad/features/web_serieses/injection_container_web_serieses.dart'
    as serieses_sl;
import 'package:breaking_bad/features/series_episode_list/injection_container_episode_list.dart'
    as episode_list_sl;

class AppRouter {
  static const String spash = '/';
  static const String webSerieses = '/webSerieses';
  static const String seriesEpisodes = '/seriesEpisodes';
  static const String episodeDetails = '/episodeDetails';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case spash:
        return MaterialPageRoute(
          builder: (_) {
            return BlocProvider<SplashCubit>(
              create: (_) => serieses_sl.seriesesSL<SplashCubit>()..init(),
              child: const SplashScreen(),
            );
          },
        );

      case webSerieses:
        return MaterialPageRoute(
          builder: (_) {
            return BlocProvider<WebSeriesesCubit>(
              create: (_) =>
                  serieses_sl.seriesesSL<WebSeriesesCubit>()..getSerieses(),
              child: const WebSeriesesPage(),
            );
          },
        );

      case seriesEpisodes:
        final String seriesName = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) {
            return BlocProvider<SeriesEpisodeListCubit>(
              create: (_) =>
                  episode_list_sl.episodeListSL<SeriesEpisodeListCubit>()
                    ..getListOfEpisodes(
                      seriesName: seriesName,
                    ),
              child: EpisodeListPage(
                seriesName: seriesName,
              ),
            );
          },
        );

      case episodeDetails:
        final Map<String, dynamic> args =
            settings.arguments as Map<String, dynamic>;
        final String episodeId = args['episodeId'] as String;
        final String episodeNamed = args['episodeName'] as String;
        return MaterialPageRoute(
          builder: (_) {
            return BlocProvider<EpisodeDetailsCubit>(
              create: (_) =>
                  episode_list_sl.episodeListSL<EpisodeDetailsCubit>()
                    ..getEpisodeDataWithCharacter(episodeId: episodeId),
              child: EpisodeDetailsPage(
                episodeId: episodeId,
                episodeNamed: episodeNamed,
              ),
            );
          },
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text(StringConst.sPageNotFound),
            ),
          ),
        );
    }
  }
}
