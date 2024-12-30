import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:question_app/features/question/presentation/cubit/auth/auth_cubit.dart';
import 'package:question_app/features/question/presentation/cubit/bottom_bar/bottombar_cubit.dart';
import 'package:question_app/features/question/presentation/cubit/difficulty/difficulty_cubit.dart';
import 'package:question_app/features/question/presentation/cubit/firestore/firestore_cubit.dart';
import 'package:question_app/features/question/presentation/cubit/leaderboard/leaderboard_cubit.dart';
import 'package:question_app/features/question/presentation/cubit/question/question_cubit.dart';
import 'package:question_app/features/question/presentation/cubit/score/true.dart';
import 'package:question_app/features/question/presentation/cubit/timer/timer_cubit.dart';
import 'package:question_app/features/question/presentation/pages/splash.dart';
import 'package:question_app/features/question/util/color.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => QuestionCubit()),
        BlocProvider(create: (context) => DifficultyCubit()),
        BlocProvider(create: (context) => QuestionCountCubit()),
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => ScoreCubit()),
        BlocProvider(create: (context) => ScoreFalseCubit()),
        BlocProvider(create: (context) => FirestoreCubit()),
        BlocProvider(create: (context) => BottombarCubit()),
        BlocProvider(create: (context) => LeaderboardCubit()),
        BlocProvider(create: (context) => TimerCubit()),
      ],
      child: MaterialApp(
        theme: theme(),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }

  ThemeData theme() {
    return ThemeData(
      scaffoldBackgroundColor: AppColor().primary,
      primaryColor: AppColor().primaryMaterialColor,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor().primary,
        foregroundColor: AppColor().white,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColor().primary,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: AppColor().white,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      ),
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          fixedSize: WidgetStatePropertyAll(
            Size.fromHeight(50),
          ),
          textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}
