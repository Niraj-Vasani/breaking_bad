import '../entities/web_series_entity.dart';
import '../repositories/web_series_repository.dart';

class GetWebSeriesesListUseCase {
  final WebSeriesesRepository _webSeriesesRepository;

  GetWebSeriesesListUseCase(this._webSeriesesRepository);

  Future<List<WebSeriesEntity>> call() async {
    return await _webSeriesesRepository.getWebSeriesList();
  }
}
