import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:question_app/features/question/presentation/cubit/score/true.dart';
import 'package:question_app/features/question/util/image.dart';

class TrueFalseCount extends StatelessWidget {
  const TrueFalseCount({super.key});

  @override
  Widget build(BuildContext context) {
    var style = const TextStyle(fontSize: 20, fontWeight: FontWeight.w600);
    double height = 35;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BlocBuilder<ScoreCubit, int>(
            builder: (context, state) {
              return Column(
                children: [
                  Image.asset(AppImage.confirm, height: height),
                  const SizedBox(height: 5),
                  Text(state.toString(), style: style),
                ],
              );
            },
          ),
          Column(
            children: [
              Image.asset(AppImage.error, height: height),
              const SizedBox(height: 5),
              BlocBuilder<ScoreFalseCubit, int>(
                builder: (context, state) {
                  return Text(state.toString(), style: style);
                },
              ),
            ],
          ),
          /*Column(
            children: [
              Image.asset(AppImage.error, height: height),
              const SizedBox(height: 5),
              BlocBuilder<TimerCubit, int>(
                builder: (context, state) {
                  return Text(state.toString(), style: style);
                },
              ),
            ],
          ),*/
        ],
      ),
    );
  }
}
