import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:question_app/features/question/domain/entities/result.dart';
import 'package:question_app/features/question/presentation/cubit/difficulty/difficulty_cubit.dart';

class DifficultyDropdownPage extends StatelessWidget {
  const DifficultyDropdownPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<DifficultyCubit, String>(
        builder: (context, selectedDifficulty) {
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
              value: selectedDifficulty,
              underline: const SizedBox(),
              items: Difficulty.values.map((e) {
                return DropdownMenuItem<String>(
                  value: e.name,
                  child: Text(e.name),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  context.read<DifficultyCubit>().updateDifficulty(newValue);
                }
              },
            ),
          );
        },
      ),
    );
  }
}
