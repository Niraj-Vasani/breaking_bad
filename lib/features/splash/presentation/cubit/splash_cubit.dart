import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  Future<void> init() async {
    try {
      await Future.delayed(
        const Duration(seconds: 2),
      );
      emit(SplashCompleted());
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
