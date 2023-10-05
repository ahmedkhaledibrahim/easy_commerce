import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_commerce/data/repositories/authentication_repo.dart';

class UserModel {
  final String name;

  final String email;

  final String password;

  final String role;

  UserModel(
      {required this.name,
      required this.email,
      required this.role,
      required this.password});

  toJson() {
    return {
      'name': this.name,
      'email': this.email,
      'role': this.role,
    };
  }

  factory UserModel.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> docSnapshot) {
    final data = docSnapshot.data();
    return UserModel(
        name: data?['name'],
        email: data?['email'],
        role: data?['role'],
        password: '');
  }

  signIn(String email, String password) {}
}
