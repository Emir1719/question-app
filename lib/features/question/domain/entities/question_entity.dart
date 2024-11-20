import 'package:question_app/features/question/domain/entities/result.dart';

class QuestionEntity {
  final int responseCode;
  final List<ResultEntity> results;

  QuestionEntity({
    required this.responseCode,
    required this.results,
  });

  QuestionEntity copyWith({
    int? responseCode,
    List<ResultEntity>? results,
  }) =>
      QuestionEntity(
        responseCode: responseCode ?? this.responseCode,
        results: results ?? this.results,
      );

  factory QuestionEntity.fromJson(Map<String, dynamic> json) {
    return QuestionEntity(
      responseCode: json['response_code'],
      results: List<ResultEntity>.from(json['results'].map((result) => ResultEntity.fromJson(result))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'response_code': responseCode,
      'results': results.map((result) => result.toJson()).toList(),
    };
  }
}
