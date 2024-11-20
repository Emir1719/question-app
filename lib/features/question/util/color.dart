import 'package:flutter/material.dart';

class AppColor {
  static final AppColor _instance = AppColor._privateConstructor();
  AppColor._privateConstructor();

  factory AppColor() {
    return _instance;
  }

  final primary = const Color(0xff6A5AE0);
  final background = const Color(0xffF8F9FA); // special white
  final backgroundLightPurple = const Color(0xffefeefc);
  final white = Colors.white;

  ///primary rengi Color'dan MaterialColor'a çevrildi.
  MaterialColor get primaryMaterialColor => MaterialColor(0xff24855B, {
        50: primary,
        100: primary,
        200: primary,
        300: primary,
        400: primary,
        500: primary,
        600: primary,
        700: primary,
        800: primary,
        900: primary,
      });
}
