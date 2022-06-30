import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../series_episode_list/domain/entities/episode_entity.dart';
import '../../domain/entities/character_entity.dart';

class EpisodeDetailWidget extends StatelessWidget {
  final EpisodeEntity episodeDetails;
  final List<CharacterEntity> characterList;

  const EpisodeDetailWidget(
      {Key? key, required this.episodeDetails, required this.characterList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime airDate = DateFormat('dd-MM-yyyy').parse(episodeDetails.airDate);
    var myFormat = DateFormat('MMM dd, yyyy');

    return Scaffold(
      appBar: AppBar(
        title: Text(episodeDetails.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Text(
                seriesValues.map.keys.firstWhere(
                  (k) => seriesValues.map[k] == episodeDetails.series,
                ),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              trailing: Text(
                'S${episodeDetails.season.trim()} E${episodeDetails.episode.trim()}',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            const Divider(
              thickness: 5,
            ),
            ListTile(
              title: Text(
                episodeDetails.title,
                style: Theme.of(context).textTheme.headline3,
              ),
              subtitle: Text(
                myFormat.format(airDate),
              ),
            ),
            Divider(
              thickness: 0.8,
              color: Colors.yellow.shade600,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.42,
              child: ListView.builder(
                itemCount: characterList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: Image(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: MediaQuery.of(context).size.height * 0.32,
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              characterList[index].img,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  characterList[index].portrayed,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  characterList[index].name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
