import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/constants.dart';
import '../cubit/episode_details_cubit.dart';
import '../widgets/episode_detail_widget.dart';

class EpisodeDetailsPage extends StatelessWidget {
  final String episodeId;
  final String episodeNamed;

  const EpisodeDetailsPage({
    Key? key,
    required this.episodeId,
    required this.episodeNamed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EpisodeDetailsCubit, EpisodeDetailsState>(
      builder: (context, state) {
        if (state is EpisodeDetailsInitial || state is EpisodeDetailsLoading) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                episodeNamed,
              ),
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is EpisodeDetailsLoaded) {
          return EpisodeDetailWidget(
            episodeDetails: state.episodeDetails,
            characterList: state.characterList,
          );
        } else if (state is EpisodeDetailsError) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                episodeNamed,
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
                episodeNamed,
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
