part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthSuccess extends AuthState {
  final AppUser? user;

  const AuthSuccess({required this.user});
}

final class AuthLoading extends AuthState {}

final class AuthSignOut extends AuthState {}

final class AuthError extends AuthState {
  final String message;

  const AuthError({required this.message});
}
