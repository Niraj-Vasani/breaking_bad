import 'package:flutter/material.dart';

import '../../../../core/utils/app_router.dart';
import '../../domain/entities/web_series_entity.dart';

class WebSeriesesBodyWidget extends StatelessWidget {
  final List<WebSeriesEntity> serieses;

  const WebSeriesesBodyWidget({Key? key, required this.serieses})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(5),
      itemCount: serieses.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        mainAxisExtent: 350,
      ),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRouter.seriesEpisodes,
              arguments: serieses[index].seriesName,
            );
          },
          child: Card(
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
                  child: Image.asset(
                    width: MediaQuery.of(context).size.width * 0.47,
                    height: MediaQuery.of(context).size.height * 0.31,
                    fit: BoxFit.cover,
                    serieses[index].image,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow.shade600,
                            ),
                            Text(
                              serieses[index].rating.toString(),
                              style:
                                  Theme.of(context).textTheme.bodyText1!.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                            ),
                          ],
                        ),
                        Text(
                          serieses[index].seriesName,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
