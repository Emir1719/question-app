import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:question_app/features/question/data/repositories/firestore_controller.dart';
import 'package:question_app/features/question/domain/model/user.dart';
import 'package:question_app/features/question/presentation/widgets/profile/profile_success.dart';
import 'package:question_app/features/question/util/init_state/error.dart';
import 'package:question_app/features/question/util/init_state/initial.dart';
import 'package:question_app/features/question/util/init_state/loading.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  final _firestore = FirestoreController();

  Future<void> load() async {
    try {
      emit(ProfileLoading());
      final user = await _firestore.getCurrentUser();
      emit(ProfileLoaded(user: user!));
    } catch (e) {
      emit(ProfileError(message: e.toString()));
    }
  }
}
