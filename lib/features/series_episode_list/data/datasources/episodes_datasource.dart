import 'package:dio/dio.dart';

import '../../../../core/error/error.dart';
import '../../../../core/retrofit/rest_client.dart';
import 'package:flutter/cupertino.dart';

import '../models/episode_model.dart';

abstract class EpisodesDataSource {
  Future<List<EpisodeModel>> getListOfEpisodes({required String seriesName});
}

class EpisodesDataSourceImpl implements EpisodesDataSource {
  final RestClient restClient =
      RestClient(Dio(), baseUrl: "https://www.breakingbadapi.com/api/");

  // EpisodesDataSourceImpl({required this.restClient});
  EpisodesDataSourceImpl();

  @override
  Future<List<EpisodeModel>> getListOfEpisodes(
      {required String seriesName}) async {
    try {
      final response = await restClient.getEpisodes(seriesName);
      return response;
    } catch (e) {
      debugPrint(e.toString());
      throw ServerException();
    }
  }
}
