part of 'question_cubit.dart';

abstract class QuestionState extends Equatable {
  const QuestionState();

  @override
  List<Object> get props => [];
}

class QuestionInitial extends QuestionState {}

class QuestionLoading extends QuestionState {}

class QuestionLoaded extends QuestionState {
  final List<Question> questions;

  const QuestionLoaded({required this.questions});
}

class QuestionError extends QuestionState {
  final String message;

  const QuestionError({required this.message});
}
