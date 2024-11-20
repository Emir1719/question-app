import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:question_app/features/question/data/repositories/auth.dart';
import 'package:question_app/features/question/data/repositories/firestore_controller.dart';
import 'package:question_app/features/question/domain/model/user.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final _repository = AuthRepository();
  final _firesore = FirestoreController();

  Future<void> register(String email, String password) async {
    try {
      emit(AuthLoading());
      final user = await _repository.register(email, password);
      await _firesore.saveUser();
      emit(AuthSuccess(user: AppUser.fromFirebaseUser(user!)));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> login(String email, String password) async {
    try {
      emit(AuthLoading());
      final user = await _repository.login(email, password);
      emit(AuthSuccess(user: AppUser.fromFirebaseUser(user!)));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> singOut() async {
    try {
      emit(AuthLoading());
      await _repository.signOut();
      emit(AuthSignOut());
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  isAuthenticated() {
    return _repository.isAuthenticated();
  }
}
