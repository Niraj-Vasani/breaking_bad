import '../../domain/entities/web_series_entity.dart';
import '../../domain/repositories/web_series_repository.dart';
import '../datasources/web_series_datasource.dart';

class WebSeriesesRepositoryImpl implements WebSeriesesRepository {
  final WebSeriesDataSource _webSeriesDataSource;

  WebSeriesesRepositoryImpl(this._webSeriesDataSource);

  @override
  Future<List<WebSeriesEntity>> getWebSeriesList() async {
    return await _webSeriesDataSource.getWebSeries();
  }
}
