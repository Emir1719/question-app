import 'package:question_app/features/question/data/models/answer.dart';
import 'package:question_app/features/question/domain/entities/category_enum.dart';
import 'package:question_app/features/question/domain/entities/result.dart';

class Question {
  final String question;
  final List<Answer> answers;
  final Type type;
  final Difficulty difficulty;
  final QuestionCategory category;

  Question({
    required this.question,
    required this.answers,
    required this.type,
    required this.difficulty,
    required this.category,
  });
}
