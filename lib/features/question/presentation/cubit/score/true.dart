import 'package:bloc/bloc.dart';

class ScoreCubit extends Cubit<int> {
  ScoreCubit() : super(0);

  void increment() => emit(state + 1);

  void reset() => emit(0);
}

class ScoreFalseCubit extends Cubit<int> {
  ScoreFalseCubit() : super(0);

  void increment() => emit(state + 1);

  void reset() => emit(0);
}
