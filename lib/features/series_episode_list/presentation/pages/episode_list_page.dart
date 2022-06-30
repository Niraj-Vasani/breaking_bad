import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/constants.dart';
import '../cubit/series_episode_list_cubit.dart';
import '../widgets/episode_list_body_widget.dart';

class EpisodeListPage extends StatelessWidget {
  final String seriesName;

  const EpisodeListPage({Key? key, required this.seriesName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeriesEpisodeListCubit, SeriesEpisodeListState>(
      builder: (context, state) {
        if (state is SeriesEpisodeListInitial ||
            state is SeriesEpisodeListLoading) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                seriesName,
              ),
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is SeriesEpisodeListLoaded) {
          return EpisodeListWidget(
            episodeList: state.episodes,
            seriesName: seriesName,
            totalSeasons: state.totalSeasons,
          );
        } else if (state is SeriesEpisodeListError) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                seriesName,
              ),
            ),
            body: Center(
              child: Text(state.message),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                seriesName,
              ),
            ),
            body: const Center(
              child: Text(StringConst.sSomethingWentWrong),
            ),
          );
        }
      },
    );
  }
}
