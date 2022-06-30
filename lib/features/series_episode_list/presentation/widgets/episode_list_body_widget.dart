import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/app_router.dart';
import '../../domain/entities/episode_entity.dart';

class EpisodeListWidget extends StatelessWidget {
  final List<EpisodeEntity> episodeList;
  final String seriesName;
  final List<String> totalSeasons;

  const EpisodeListWidget({
    Key? key,
    required this.episodeList,
    required this.seriesName,
    required this.totalSeasons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: totalSeasons.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            seriesName,
          ),
          bottom: TabBar(
            tabs: totalSeasons
                .map((season) => Text(season))
                .toList(),
            isScrollable: true,
            labelPadding:
                const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
          ),
        ),
        body: TabBarView(
          children: totalSeasons.map((season) {
            List<EpisodeEntity> filteredList = episodeList
                .where((episode) => episode.season.trim() == season)
                .toList();
            return ListView.builder(
              itemCount: filteredList.length,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              itemBuilder: (context, index) {
                DateTime airDate =
                    DateFormat('dd-MM-yyyy').parse(filteredList[index].airDate);
                var myFormat = DateFormat('dd-MMM-yyyy');
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRouter.episodeDetails,
                      arguments: {
                        "episodeId": filteredList[index].episodeId.toString(),
                        "episodeName": filteredList[index].title,
                      },
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 2,
                    child: ListTile(
                      title: Text(
                        '${filteredList[index].episode}. ${filteredList[index].title}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      subtitle: Text(myFormat.format(airDate)),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
