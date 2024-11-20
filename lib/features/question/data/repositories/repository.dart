import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:http/http.dart' as http;
import 'package:question_app/features/question/data/models/answer.dart';
import 'package:question_app/features/question/data/models/question.dart';
import 'package:question_app/features/question/domain/entities/category_enum.dart';
import 'package:question_app/features/question/domain/entities/result.dart';

class QuestionRepository {
  Future<List<Question>> fetchQuestions({
    required int amount,
    QuestionCategory? category,
    Difficulty? difficulty,
  }) async {
    Uri url;
    if (category == QuestionCategory.any) {
      url = Uri.parse(
          'https://opentdb.com/api.php?amount=$amount&difficulty=${difficulty?.name ?? "easy"}&type=multiple');
    } else {
      url = Uri.parse(
          'https://opentdb.com/api.php?amount=$amount&category=${category?.value ?? "10"}&difficulty=${difficulty?.name ?? "easy"}&type=multiple');
    }

    debugPrint('https://opentdb.com/api.php?amount=$amount&difficulty=${difficulty?.name ?? "easy"}&type=multiple');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return _mapResponseToQuestions(json.decode(response.body));
    } else {
      throw Exception('Failed to load questions');
    }
  }

  List<Question> _mapResponseToQuestions(Map<String, dynamic> jsonResponse) {
    HtmlUnescape unescape = HtmlUnescape();

    final List<ResultEntity> results =
        (jsonResponse['results'] as List).map((result) => ResultEntity.fromJson(result)).toList();

    return results.map((result) {
      final List<Answer> answers = [
        Answer(text: unescape.convert(result.correctAnswer), isCorrect: true),
        ...result.incorrectAnswers.map((answer) => Answer(text: unescape.convert(answer), isCorrect: false)),
      ]..shuffle();

      return Question(
        question: unescape.convert(result.question),
        answers: answers,
        type: result.type,
        difficulty: result.difficulty,
        category: result.category,
      );
    }).toList();
  }
}
