import '../models/web_series_model.dart';
import 'local_web_series_list.dart';

abstract class WebSeriesDataSource {
  Future<List<WebSeriesModel>> getWebSeries();
}

class WebSeriesDataSourceImpl implements WebSeriesDataSource {
  @override
  Future<List<WebSeriesModel>> getWebSeries() async {
    return await Future.value(webSeriesesList);
  }
}
