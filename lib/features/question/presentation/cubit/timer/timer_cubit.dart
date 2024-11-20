import 'dart:async';

import 'package:bloc/bloc.dart';

class TimerCubit extends Cubit<int> {
  Timer? _timer;

  TimerCubit() : super(0);

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      emit(state + 1);
    });
  }

  void stopTimer() {
    _timer?.cancel();
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
