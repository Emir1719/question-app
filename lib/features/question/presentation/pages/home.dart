import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:question_app/features/question/presentation/cubit/bottom_bar/bottombar_cubit.dart';
import 'package:question_app/features/question/presentation/pages/leaderboard.dart';
import 'package:question_app/features/question/presentation/pages/profile.dart';
import 'package:question_app/features/question/presentation/pages/question_category.dart';
import 'package:question_app/features/question/util/color.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottombarCubit, int>(
        builder: (context, state) {
          return IndexedStack(
            index: state,
            children: const [
              QuestionCategoryView(),
              ProfileView(),
              LeaderboardView(),
            ],
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<BottombarCubit, int>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state,
            backgroundColor: AppColor().white,
            selectedLabelStyle: const TextStyle(fontSize: 14),
            unselectedLabelStyle: const TextStyle(fontSize: 14),
            onTap: (index) {
              context.read<BottombarCubit>().change(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.leaderboard),
                label: 'Leaderboard',
              ),
            ],
          );
        },
      ),
    );
  }
}
