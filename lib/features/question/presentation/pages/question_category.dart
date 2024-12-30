import 'package:flutter/material.dart';
import 'package:question_app/features/question/domain/entities/category_enum.dart';
import 'package:question_app/features/question/presentation/pages/question_option.dart';
import 'package:question_app/features/question/util/color.dart';
import 'package:question_app/features/question/util/padding.dart';

class QuestionCategoryView extends StatelessWidget {
  const QuestionCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = getCategory();

    return Scaffold(
      appBar: AppBar(title: const Text("Kategoriler")),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Container(
            decoration:
                BoxDecoration(color: AppColor().white, borderRadius: BorderRadius.circular(15)),
            margin: AppPadding.defaultPadding,
            child: GridView.builder(
              gridDelegate: orientation == Orientation.portrait ? grid(2) : grid(4),
              itemCount: categories.length,
              padding: AppPadding.all20,
              itemBuilder: (context, index) {
                var category = categories[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QuestionOption(category: category)),
                    );
                  },
                  child: Container(
                    decoration: decor(),
                    padding: AppPadding.defaultPadding,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        container(),
                        const SizedBox(height: 10),
                        categoryName(category),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  SliverGridDelegateWithFixedCrossAxisCount grid(int count) {
    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: count,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
    );
  }

  BoxDecoration decor() {
    return BoxDecoration(
      color: AppColor().backgroundLightPurple,
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      border: Border.all(width: 0, color: Colors.transparent),
    );
  }

  Widget categoryName(QuestionCategory category) {
    return Text(
      category.toDisplayName(),
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColor().primary,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
    );
  }

  Container container() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColor().white,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        border: Border.all(width: 0, color: Colors.transparent),
      ),
      child: Icon(Icons.book, size: 34, color: AppColor().primary),
    );
  }

  List<QuestionCategory> getCategory() {
    return QuestionCategory.values;
  }
}
