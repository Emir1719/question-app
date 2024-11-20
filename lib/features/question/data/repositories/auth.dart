import 'package:firebase_auth/firebase_auth.dart';
import 'package:question_app/features/question/util/error.dart';

class AuthRepository {
  final _auth = FirebaseAuth.instance;

  bool isAuthenticated() {
    return _auth.currentUser != null ? true : false;
  }

  /// Email ve password ile giriş yapar
  Future<User?> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthErrorHandler.getMessageByCode(e);
    }
  }

  /// Email ve password ile kayıt olur
  Future<User?> register(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthErrorHandler.getMessageByCode(e);
    }
  }

  /// Kullanıcının oturumunu kapatır
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthErrorHandler.getMessageByCode(e);
    }
  }
}
