// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:question_app/features/question/domain/entities/category_enum.dart';
import 'package:question_app/features/question/domain/entities/result.dart';
import 'package:question_app/features/question/presentation/cubit/difficulty/difficulty_cubit.dart';
import 'package:question_app/features/question/presentation/cubit/question/question_cubit.dart';
import 'package:question_app/features/question/presentation/widgets/page_builder.dart';
import 'package:question_app/features/question/presentation/widgets/true_false_count.dart';
import 'package:question_app/features/question/util/color.dart';
import 'package:question_app/features/question/util/padding.dart';

class QuestionView extends StatelessWidget {
  const QuestionView({super.key, required this.category});
  final QuestionCategory category;

  @override
  Widget build(BuildContext context) {
    final difficulty = context.read<DifficultyCubit>().state;
    final count = context.read<QuestionCountCubit>().state;

    return BlocProvider(
      create: (context) => QuestionCubit()
        ..getQuestions(
          amount: int.parse(count),
          difficulty: Difficulty.values.firstWhere((element) => element.name == difficulty),
          category: category,
        ),
      child: OrientationBuilder(
        builder: (context, orientation) {
          return Scaffold(
            appBar: orientation == Orientation.portrait ? AppBar(title: const Text("Sorular")) : null,
            body: Container(
              height: double.infinity,
              decoration: BoxDecoration(color: AppColor().white, borderRadius: BorderRadius.circular(15)),
              margin: AppPadding.defaultPadding,
              padding: AppPadding.defaultPadding,
              child: BlocBuilder<QuestionCubit, QuestionState>(
                builder: (context, state) {
                  if (state is QuestionLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is QuestionLoaded) {
                    return Column(
                      children: [
                        const TrueFalseCount(),
                        QuestionPageViewBuilder(state: state),
                      ],
                    );
                  } else if (state is QuestionError) {
                    return Center(child: Text(state.message));
                  }
                  return Container();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
