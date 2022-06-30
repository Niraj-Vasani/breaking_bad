import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/web_series_entity.dart';
import '../../domain/usecases/get_web_serieses_list_usecas.dart';

part 'web_serieses_state.dart';

class WebSeriesesCubit extends Cubit<WebSeriesesState> {
  final GetWebSeriesesListUseCase getWebSeriesesListUseCase;

  WebSeriesesCubit({
    required this.getWebSeriesesListUseCase,
  }) : super(WebSeriesesInitial());

  Future<void> getSerieses() async {
    emit(WebSeriesesLoading());
    try {
      List<WebSeriesEntity> serieses = await getWebSeriesesListUseCase.call();
      emit(WebSeriesesLoaded(serieses: serieses));
    } catch (e) {
      emit(WebSeriesesError(message: e.toString()));
    }
  }
}
