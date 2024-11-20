import 'package:bloc/bloc.dart';
import 'package:question_app/features/question/domain/entities/result.dart';

class DifficultyCubit extends Cubit<String> {
  DifficultyCubit() : super(Difficulty.easy.name);

  void updateDifficulty(String newDifficulty) {
    emit(newDifficulty);
  }
}

class QuestionCountCubit extends Cubit<String> {
  QuestionCountCubit() : super("5");

  void update(String value) {
    emit(value);
  }
}
