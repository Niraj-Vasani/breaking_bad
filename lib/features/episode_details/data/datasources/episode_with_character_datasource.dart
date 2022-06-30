import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../core/error/error.dart';
import '../../../../core/retrofit/rest_client.dart';
import '../../../series_episode_list/data/models/episode_model.dart';
import '../models/character_model.dart';

abstract class EpisodeWithCharacterDataSource {
  Future<EpisodeModel> getEpisodeById({required String episodeId});
  Future<CharacterModel> getCharacterByName({required String characterName});
  Future<List<CharacterModel>> getAllCharacte();
}

class EpisodeWithCharacterDataSourceImpl
    implements EpisodeWithCharacterDataSource {
  final RestClient restClient =
      RestClient(Dio(), baseUrl: "https://www.breakingbadapi.com/api/");

  EpisodeWithCharacterDataSourceImpl();

  @override
  Future<EpisodeModel> getEpisodeById({required String episodeId}) async {
    try {
      final List<EpisodeModel> response =
          await restClient.getEpisodebyId(int.parse(episodeId));
      debugPrint('episode by id:: length ${response.length}');
      return response[0];
    } catch (e) {
      debugPrint(e.toString());
      throw ServerException();
    }
  }

  @override
  Future<CharacterModel> getCharacterByName(
      {required String characterName}) async {
    try {
      final List<CharacterModel> response =
          await restClient.getCharacterByName(characterName);
      debugPrint('character by name:: length ${response.length}');
      return response[0];
    } catch (e) {
      debugPrint(e.toString());
      throw ServerException();
    }
  }

  @override
  Future<List<CharacterModel>> getAllCharacte() async {
    try {
      final List<CharacterModel> response = await restClient.getAllCharacter();
      return response;
    } catch (e) {
      debugPrint(e.toString());
      throw ServerException();
    }
  }
}
