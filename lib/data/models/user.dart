import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String name;

  late final String _email;

  late final String _password;

  final String role;

  UserModel(
      {required this.name,
      required String email,
      required this.role,
      required String password}) {
    _email = email;
    _password = password;
  }

  toJson() {
    return {
      'name': name,
      'email': _email,
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

  String get password {
    return _password;
  }

  String get email {
    return _email;
  }

  signIn(String email, String password) {}
}
