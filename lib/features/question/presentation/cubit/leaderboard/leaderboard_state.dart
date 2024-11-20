part of 'leaderboard_cubit.dart';

sealed class LeaderboardState extends Equatable {
  const LeaderboardState();

  @override
  List<Object> get props => [];
}

final class LeaderboardInitial extends LeaderboardState {
  final List<AppUser> users;

  const LeaderboardInitial({required this.users});

  @override
  List<Object> get props => [users];
}

final class LeaderboardLoading extends LeaderboardState {
  @override
  List<Object> get props => [];
}

final class LeaderboardLoaded extends LeaderboardState {
  final List<AppUser> users;

  const LeaderboardLoaded({required this.users});

  @override
  List<Object> get props => [users];
}

final class LeaderboardError extends LeaderboardState {
  @override
  List<Object> get props => [];
}
