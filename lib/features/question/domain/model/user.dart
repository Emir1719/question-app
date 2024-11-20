// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppUser {
  final String uid;
  final String name;
  final String email;
  final int mark;
  final int level;

  AppUser({
    required this.uid,
    required this.email,
    required this.name,
    this.level = 0,
    this.mark = 0,
  });

  // Firebase User'dan MyUser'a dönüşüm yapan bir fabrika kurucu oluşturun
  factory AppUser.fromFirebaseUser(User user) {
    return AppUser(
      uid: user.uid,
      email: user.email!,
      name: user.displayName ?? user.email?.substring(0, user.email?.indexOf("@")) ?? "Boş",
    );
  }

  static Future<AppUser> fromFirestore(User user) async {
    final doc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
    final data = doc.data();

    if (data != null) {
      return AppUser.fromMap(data);
    } else {
      return AppUser.fromFirebaseUser(user);
    }
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) => AppUser.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'email': email,
      'mark': mark,
      'level': level,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      uid: map['uid'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      mark: map['mark'] as int,
      level: map['level'] as int,
    );
  }
}
