import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:question_app/features/question/data/repositories/user_repo.dart';
import 'package:question_app/features/question/domain/model/user.dart';

class FirestoreController {
  final _firestore = FirebaseFirestore.instance;
  CollectionReference get _userCollections => _firestore.collection("users");

  Future<bool> saveUser() async {
    try {
      final user = UserRepository().user; // Güncel kullanıcı çekilir
      final map = user.toMap(); // Propertiler map yapısına dönüştürülür
      await _userCollections.doc(user.uid).set(map); // user id'ye göre kayıt yapılır
      return true;
    } catch (e) {
      throw Exception("Kullanıcı kayıt edilemedi: ${e.toString()}");
    }
  }

  String get _userCollection => "users";

  Future<AppUser?> getCurrentUser() async {
    try {
      final user = UserRepository().user;
      final document = await _firestore.doc("$_userCollection/${user.uid}").get();

      if (document.data() != null && document.exists) {
        return AppUser.fromMap(document.data()!);
      }

      throw Exception("Kullanıcının belgelerine veri tabanından erişilemedi");
    } catch (e) {
      throw Exception("Kullanıcı veri tabanından getirilemedi: ${e.toString()}");
    }
  }

  Future<AppUser?> getUserById(String id) async {
    try {
      final document = await _firestore.doc("$_userCollection/$id").get();

      if (document.data() != null && document.exists) {
        return AppUser.fromMap(document.data()!);
      }

      throw Exception("Kullanıcının belgelerine veri tabanından erişilemedi");
    } catch (e) {
      throw Exception("Kullanıcı veri tabanından getirilemedi: ${e.toString()}");
    }
  }

  Future<List<AppUser>> getUserOrderByMark() async {
    try {
      final document = await _userCollections.orderBy("mark", descending: true).get();
      return document.docs.map((e) {
        final data = e.data();

        if (data is Map<String, dynamic>) {
          return AppUser.fromMap(data);
        } else {
          throw Exception("Veri yanlış formatta: $data");
        }
      }).toList();
    } catch (e) {
      throw Exception("Kullanıcı veri tabanından getirilemedi: $e");
    }
  }

  Future<void> updateMark(int mark) async {
    try {
      final user = UserRepository().user;

      // Kullanıcının mevcut puanını al
      DocumentSnapshot userDoc = await _userCollections.doc(user.uid).get();
      Map<String, dynamic>? userData = userDoc.data() as Map<String, dynamic>?;
      int currentMark = userData?['mark'] ?? 0;
      int newMark = currentMark + mark;

      // Yeni mark'a göre level hesapla
      int currentLevel = userData?['level'] ?? 0;
      int newLevel = currentLevel + (newMark ~/ 100) - (currentMark ~/ 100);

      await _userCollections.doc(user.uid).update({
        'mark': newMark,
        'level': newLevel,
      });
    } catch (e) {
      throw Exception("Puan ve seviye güncellenemedi: ${e.toString()}");
    }
  }
}
