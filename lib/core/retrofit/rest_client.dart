import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/episode_details/data/models/character_model.dart';
import '../../features/series_episode_list/data/models/episode_model.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://www.breakingbadapi.com/api/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/episodes")
  Future<List<EpisodeModel>> getEpisodes(@Query("series") String series);

  @GET("/episodes/{episode_id}")
  Future<List<EpisodeModel>> getEpisodebyId(@Path("episode_id") int episodeId);

  @GET("/characters")
  Future<List<CharacterModel>> getCharacterByName(@Query("name") String characterName);
  
  @GET("/characters")
  Future<List<CharacterModel>> getAllCharacter();
}