import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:question_app/features/question/presentation/cubit/leaderboard/leaderboard_cubit.dart';
import 'package:question_app/features/question/presentation/widgets/leadeboard_list.dart';
import 'package:question_app/features/question/util/color.dart';
import 'package:question_app/features/question/util/padding.dart';

class LeaderboardView extends StatelessWidget {
  const LeaderboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LeaderboardCubit()..getUsersOrderByMark(),
      child: Scaffold(
        backgroundColor: AppColor().white,
        appBar: AppBar(title: const Text("Leaderboard")),
        body: Padding(
          padding: AppPadding.defaultPadding,
          child: BlocBuilder<LeaderboardCubit, LeaderboardState>(
            builder: (context, state) {
              final bloc = BlocProvider.of<LeaderboardCubit>(context);

              if (state is LeaderboardLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is LeaderboardLoaded) {
                return RefreshIndicator(
                  onRefresh: () async {
                    await bloc.getUsersOrderByMark();
                  },
                  child: LeaderboardListView(state: state),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
