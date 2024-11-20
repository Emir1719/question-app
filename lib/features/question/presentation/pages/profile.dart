// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:question_app/features/question/presentation/cubit/profile/profile_cubit.dart';
import 'package:question_app/features/question/util/color.dart';
import 'package:question_app/features/question/util/padding.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..load(),
      child: Scaffold(
        backgroundColor: AppColor().white,
        appBar: AppBar(title: const Text("Profil")),
        body: Padding(
          padding: AppPadding.defaultPadding,
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              return RefreshIndicator(
                onRefresh: () async {
                  await context.read<ProfileCubit>().load();
                },
                child: state.build(),
              );
            },
          ),
        ),
      ),
    );
  }
}
