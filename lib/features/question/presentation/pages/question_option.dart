import 'package:flutter/material.dart';
import 'package:question_app/features/question/domain/entities/category_enum.dart';
import 'package:question_app/features/question/presentation/pages/question.dart';
import 'package:question_app/features/question/presentation/widgets/diff_drop.dart';
import 'package:question_app/features/question/presentation/widgets/que_count.dart';
import 'package:question_app/features/question/util/color.dart';
import 'package:question_app/features/question/util/image.dart';
import 'package:question_app/features/question/util/padding.dart';
import 'package:question_app/features/question/util/style.dart';

class QuestionOption extends StatelessWidget {
  const QuestionOption({super.key, required this.category});
  final QuestionCategory category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: OrientationBuilder(builder: (context, orientation) {
        return Column(
          children: [
            orientation == Orientation.portrait
                ? Image.asset(AppImage.study, height: 180)
                : const SizedBox(),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: AppPadding.defaultPadding,
                margin: AppPadding.defaultPadding,
                decoration:
                    BoxDecoration(color: AppColor().white, borderRadius: BorderRadius.circular(15)),
                child: ListView(
                  children: [
                    selectCategory(),
                    const SizedBox(height: 20),
                    selectDifficulty(),
                    const SizedBox(height: 20),
                    selectQuestionCount(),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => QuestionView(category: category)),
                        );
                      },
                      style: AppStyle().buttonStyle(context),
                      child: const Text("Sınava Girin"),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  Column selectQuestionCount() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Soru Sayısı Seçin", style: TextStyle(fontSize: 16)),
        SizedBox(height: 10),
        QuestionCountDropdown(),
      ],
    );
  }

  Column selectDifficulty() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Zorluk Seçin", style: TextStyle(fontSize: 16)),
        SizedBox(height: 10),
        DifficultyDropdownPage(),
      ],
    );
  }

  Column selectCategory() {
    return Column(
      children: [
        const Text(
          "Seçilen Kategori",
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 10),
        Text(
          category.toDisplayName(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.deepOrange,
          ),
        ),
      ],
    );
  }
}
