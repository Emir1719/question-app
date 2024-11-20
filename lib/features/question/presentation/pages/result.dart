import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:question_app/features/question/presentation/cubit/firestore/firestore_cubit.dart';
import 'package:question_app/features/question/util/color.dart';
import 'package:question_app/features/question/util/image.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key, required this.trueCount, required this.falseCount});
  final int trueCount;
  final int falseCount;

  @override
  Widget build(BuildContext context) {
    bool isWin = trueCount >= falseCount;
    var style = const TextStyle(fontSize: 24, fontWeight: FontWeight.w600);
    var mark = trueCount * 10;

    context.read<FirestoreCubit>().updateMark(mark);

    return Scaffold(
      backgroundColor: AppColor().white,
      appBar: AppBar(title: const Text("Sonuçlar")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Image.asset(AppImage.confirm, height: 50),
                    const SizedBox(height: 10),
                    Text(trueCount.toString(), style: style),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(AppImage.reward, height: 70),
                    const SizedBox(height: 10),
                    Text("$mark Puan", style: style),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(AppImage.error, height: 50),
                    const SizedBox(height: 10),
                    Text(falseCount.toString(), style: style),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 70),
            Image.asset(isWin ? AppImage.win : AppImage.gameOver, height: 150),
          ],
        ),
      ),
    );
  }
}
