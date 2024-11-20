import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:question_app/features/question/presentation/cubit/difficulty/difficulty_cubit.dart';

class QuestionCountDropdown extends StatelessWidget {
  const QuestionCountDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final list = ["5", "10", "15", "20", "25", "30", "40", "50"];

    return Center(
      child: BlocBuilder<QuestionCountCubit, String>(
        builder: (context, value) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: DropdownButton<String>(
              isExpanded: true,
              itemHeight: 60,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              isDense: true,
              value: value,
              items: list.map((e) {
                return DropdownMenuItem<String>(
                  value: e,
                  child: Text(e),
                );
              }).toList(),
              underline: const SizedBox(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  context.read<QuestionCountCubit>().update(newValue);
                }
              },
            ),
          );
        },
      ),
    );
  }
}
