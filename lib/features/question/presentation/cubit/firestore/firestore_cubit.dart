import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:question_app/features/question/data/repositories/firestore_controller.dart';

part 'firestore_state.dart';

class FirestoreCubit extends Cubit<FirestoreState> {
  FirestoreCubit() : super(FirestoreInitial());

  final _firestore = FirestoreController();

  void updateMark(int mark) async {
    try {
      emit(FirestoreMarkUpdateLoading());
      await _firestore.updateMark(mark);
      emit(FirestoreMarkUpdated());
    } catch (e) {}
  }
}
