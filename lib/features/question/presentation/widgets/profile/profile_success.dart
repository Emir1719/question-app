import 'package:flutter/material.dart';
import 'package:question_app/features/question/presentation/cubit/profile/profile_cubit.dart';
import 'package:question_app/features/question/util/color.dart';
import 'package:question_app/features/question/util/padding.dart';

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
              backgroundColor: Colors.orange.shade50,
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                "${user.level + 1}. seviye için ${(user.mark % 100)}% tamamlandı",
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Column column(String title, String value, IconData? icon) {
    return Column(
      children: [
        Icon(icon, size: 34, color: AppColor().primary),
        SizedBox(height: 8),
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
