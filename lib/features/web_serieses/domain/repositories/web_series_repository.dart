import '../entities/web_series_entity.dart';

abstract class WebSeriesesRepository {
  Future<List<WebSeriesEntity>> getWebSeriesList();
}