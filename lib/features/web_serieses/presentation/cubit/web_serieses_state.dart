part of 'web_serieses_cubit.dart';

abstract class WebSeriesesState extends Equatable {
  const WebSeriesesState();

  @override
  List<Object> get props => [];
}

class WebSeriesesInitial extends WebSeriesesState {}

class WebSeriesesLoading extends WebSeriesesState {}

class WebSeriesesLoaded extends WebSeriesesState {
  final List<WebSeriesEntity> serieses;

  const WebSeriesesLoaded({required this.serieses});

  @override
  List<Object> get props => [serieses];
}

class WebSeriesesError extends WebSeriesesState {
  final String message;

  const WebSeriesesError({required this.message});

  @override
  List<Object> get props => [message];
}
