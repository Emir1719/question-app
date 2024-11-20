import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:question_app/features/question/data/models/question.dart';
import 'package:question_app/features/question/data/repositories/repository.dart';
import 'package:question_app/features/question/domain/entities/category_enum.dart';
import 'package:question_app/features/question/domain/entities/result.dart';

part 'question_state.dart';

class QuestionCubit extends Cubit<QuestionState> {
  QuestionCubit() : super(QuestionInitial());

  final _repository = QuestionRepository();

  void getQuestions({required int amount, QuestionCategory? category, Difficulty? difficulty}) async {
    try {
      emit(QuestionLoading());
      final questions = await _repository.fetchQuestions(amount: amount, category: category, difficulty: difficulty);
      emit(QuestionLoaded(questions: questions));
    } catch (e) {
      emit(QuestionError(message: e.toString()));
    }
  }
}
