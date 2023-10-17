import 'package:cloud_firestore/cloud_firestore.dart';


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
      'name': name,
      'email': email,
      'role': role,
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
