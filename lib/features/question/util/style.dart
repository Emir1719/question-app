import 'package:flutter/material.dart';
import 'package:question_app/features/question/util/color.dart';

class AppStyle {
  static final instance = AppStyle._();

  AppStyle._();

  factory AppStyle() {
    return instance;
  }

  ButtonStyle buttonStyle(BuildContext context) => ElevatedButton.styleFrom(
        fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
        padding: const EdgeInsets.symmetric(vertical: 20),
        backgroundColor: AppColor().primary,
        surfaceTintColor: Colors.transparent,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontSize: 16),
        alignment: Alignment.center,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      );
}
