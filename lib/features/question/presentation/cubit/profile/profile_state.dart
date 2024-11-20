part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  Widget build();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {
  @override
  Widget build() => const AppCubitInitial();

  @override
  List<Object> get props => [];
}

final class ProfileLoading extends ProfileState {
  @override
  Widget build() => const AppCubitLoading();

  @override
  List<Object> get props => [];
}

final class ProfileError extends ProfileState {
  final String message;

  const ProfileError({required this.message});

  @override
  Widget build() => AppCubitError(message: message);

  @override
  List<Object> get props => [];
}

final class ProfileLoaded extends ProfileState {
  final AppUser user;

  const ProfileLoaded({required this.user});

  @override
  Widget build() => ProfileSuccess(state: this);

  @override
  List<Object> get props => [];
}
