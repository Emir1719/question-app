import 'package:question_app/features/question/domain/entities/category_enum.dart';

class ResultEntity {
  final Type type;
  final Difficulty difficulty;
  final QuestionCategory category;
  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswers;

  ResultEntity({
    required this.difficulty,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
    this.type = Type.multiple,
    this.category = QuestionCategory.any,
  });

  ResultEntity copyWith({
    Type? type,
    Difficulty? difficulty,
    QuestionCategory? category,
    String? question,
    String? correctAnswer,
    List<String>? incorrectAnswers,
  }) =>
      ResultEntity(
        type: type ?? this.type,
        difficulty: difficulty ?? this.difficulty,
        category: category ?? this.category,
        question: question ?? this.question,
        correctAnswer: correctAnswer ?? this.correctAnswer,
        incorrectAnswers: incorrectAnswers ?? this.incorrectAnswers,
      );

  /*factory ResultEntity.fromJson(Map<String, dynamic> json) {
    return ResultEntity(
      type: Type.values.byName(json['type']),
      difficulty: Difficulty.values.byName(json['difficulty']),
      category: QuestionCategory.values.firstWhere((e) => e.value == json['category']),
      question: json['question'],
      correctAnswer: json['correct_answer'],
      incorrectAnswers: List<String>.from(json['incorrect_answers']),
    );
  }*/

  /*factory ResultEntity.fromJson(Map<String, dynamic> json) {
    return ResultEntity(
      type: json['type'],
      difficulty: json['difficulty'],
      category: json['category'],
      question: json['question'],
      correctAnswer: json['correct_answer'],
      incorrectAnswers: List<String>.from(json['incorrect_answers']),
    );
  }
*/
  factory ResultEntity.fromJson(Map<String, dynamic> json) {
    return ResultEntity(
      type: Type.fromJson(json['type']),
      difficulty: Difficulty.fromJson(json['difficulty']),
      category: QuestionCategory.fromJson(json['category']),
      question: json['question'],
      correctAnswer: json['correct_answer'],
      incorrectAnswers: List<String>.from(json['incorrect_answers']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type.name,
      'difficulty': difficulty.name,
      'category': category.value,
      'question': question,
      'correct_answer': correctAnswer,
      'incorrect_answers': incorrectAnswers,
    };
  }
}

enum Difficulty {
  easy,
  medium,
  hard;

  String toJson() => name;
  static Difficulty fromJson(String json) => values.byName(json);
}

enum Type {
  multiple;

  String toJson() => name;
  static Type fromJson(String json) => values.byName(json);
}
