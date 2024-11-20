import 'package:firebase_auth/firebase_auth.dart';
import 'package:question_app/features/question/domain/model/user.dart';

class UserRepository {
  final _auth = FirebaseAuth.instance;

  AppUser get user => AppUser.fromFirebaseUser(_auth.currentUser!);

  Future<AppUser> get userFirestore async => await AppUser.fromFirestore(_auth.currentUser!);
}
