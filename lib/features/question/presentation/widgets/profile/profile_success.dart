import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:question_app/features/question/presentation/cubit/auth/auth_cubit.dart';
import 'package:question_app/features/question/presentation/cubit/profile/profile_cubit.dart';
import 'package:question_app/features/question/presentation/pages/splash.dart';
import 'package:question_app/features/question/util/padding.dart';
import 'package:question_app/features/question/util/style.dart';

class ProfileSuccess extends StatelessWidget {
  const ProfileSuccess({super.key, required this.state});
  final ProfileLoaded state;

  @override
  Widget build(BuildContext context) {
    var user = state.user;

    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(user.email, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            Container(
              padding: AppPadding.defaultPadding,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  column("Puan", user.mark.toString(), Icons.policy_outlined),
                  column("Level", user.level.toString(), Icons.analytics_outlined),
                ],
              ),
            ),
            LinearProgressIndicator(
              value: (user.mark % 100) / 100,
              minHeight: 10,
              valueColor: const AlwaysStoppedAnimation(Colors.deepOrange),
            ),
            const SizedBox(height: 5),
            Center(
              child: Text(
                "${user.level + 1}. seviye için ${(user.mark % 100)}% tamamlandı",
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                try {
                  context.read<AuthCubit>().singOut();

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const SplashScreen()),
                  );
                } catch (e) {
                  print(e);
                }
              },
              style: AppStyle().buttonStyle(context),
              child: const Text("Çıkış yap"),
            ),
          ],
        ),
      ],
    );
  }

  Column column(String title, String value, IconData? icon) {
    return Column(
      children: [
        Icon(icon, size: 32),
        Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
