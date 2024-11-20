// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:question_app/features/question/data/models/answer.dart';
import 'package:question_app/features/question/presentation/cubit/question/question_cubit.dart';
import 'package:question_app/features/question/presentation/cubit/score/true.dart';
import 'package:question_app/features/question/presentation/pages/result.dart';
import 'package:question_app/features/question/util/style.dart';

class QuestionPageViewBuilder extends StatelessWidget {
  const QuestionPageViewBuilder({super.key, required this.state});
  final QuestionLoaded state;

  @override
  Widget build(BuildContext context) {
    PageController? controller = PageController();

    return Expanded(
      child: PageView.builder(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: state.questions.length,
        itemBuilder: (context, index) {
          final item = state.questions[index];

          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "${index + 1}) ${item.question}",
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  ...item.answers.map((answer) {
                    print([answer.text, answer.isCorrect]);
                    return answers(answer, index, state, controller, context);
                  }),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                  onPressed: () {
                    controller.nextPage(
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.bounceIn,
                    );
                  },
                  child: const Text("Pas Geç"),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Padding answers(Answer answer, int index, QuestionLoaded state, PageController controller, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: ElevatedButton(
        onPressed: () {
          debugPrint(answer.isCorrect.toString());

          if (answer.isCorrect) {
            context.read<ScoreCubit>().increment();
          } else {
            context.read<ScoreFalseCubit>().increment();
          }

          if (index < state.questions.length - 1) {
            controller.nextPage(
              duration: const Duration(milliseconds: 100),
              curve: Curves.bounceIn,
            );
          } else {
            var score = context.read<ScoreCubit>().state;
            var scoreFalse = context.read<ScoreFalseCubit>().state;
            context.read<ScoreCubit>().reset();
            context.read<ScoreFalseCubit>().reset();

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ResultView(
                  trueCount: score,
                  falseCount: scoreFalse,
                ),
              ),
            );
          }
        },
        style: AppStyle().buttonStyle(context),
        child: Text(answer.text),
      ),
    );
  }
}
