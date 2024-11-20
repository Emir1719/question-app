import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:question_app/features/question/data/repositories/firestore_controller.dart';
import 'package:question_app/features/question/domain/model/user.dart';

part 'leaderboard_state.dart';

class LeaderboardCubit extends Cubit<LeaderboardState> {
  LeaderboardCubit() : super(const LeaderboardInitial(users: []));

  final _firestore = FirestoreController();

  Future<void> getUsersOrderByMark() async {
    try {
      emit(LeaderboardLoading());
      var users = await _firestore.getUserOrderByMark();
      emit(LeaderboardLoaded(users: users));
    } catch (e) {
      emit(LeaderboardError());
    }
  }
}
