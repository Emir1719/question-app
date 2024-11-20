part of 'firestore_cubit.dart';

sealed class FirestoreState extends Equatable {
  const FirestoreState();

  @override
  List<Object> get props => [];
}

final class FirestoreInitial extends FirestoreState {}

final class FirestoreMarkUpdated extends FirestoreState {}

final class FirestoreMarkUpdateLoading extends FirestoreState {}
