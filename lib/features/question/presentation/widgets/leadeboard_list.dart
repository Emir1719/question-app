import 'package:flutter/material.dart';
import 'package:question_app/features/question/data/repositories/user_repo.dart';
import 'package:question_app/features/question/domain/model/user.dart';
import 'package:question_app/features/question/presentation/cubit/leaderboard/leaderboard_cubit.dart';
import 'package:question_app/features/question/util/color.dart';
import 'package:question_app/features/question/util/image.dart';

class LeaderboardListView extends StatelessWidget {
  const LeaderboardListView({super.key, required this.state});
  final LeaderboardLoaded state;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: state.users.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        var user = state.users[index];

        return Card(
          color: isCurrentUser(user) ? AppColor().primary : Colors.grey.shade200,
          child: ListTile(
            title: Text(user.name, style: titleStyle(user)),
            subtitle: Text("${user.mark} Puan", style: subtitleStyle(user)),
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Text((index + 1).toString(), style: chipStyle()),
            ),
            trailing: index == 0 ? Image.asset(AppImage.trophy, height: 30) : null,
          ),
        );
      },
    );
  }

  TextStyle chipStyle() => const TextStyle(fontSize: 16, fontWeight: FontWeight.w600);

  TextStyle subtitleStyle(AppUser user) {
    return TextStyle(
      fontSize: 15,
      color: isCurrentUser(user) ? Colors.white : Colors.black,
    );
  }

  TextStyle titleStyle(AppUser user) {
    return TextStyle(
      fontSize: 18,
      color: isCurrentUser(user) ? Colors.white : Colors.black,
      fontWeight: FontWeight.w500,
    );
  }

  bool isCurrentUser(AppUser user) => UserRepository().user.email == user.email;
}
