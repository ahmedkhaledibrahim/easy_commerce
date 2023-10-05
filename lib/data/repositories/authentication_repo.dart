import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_commerce/data/local/userServices.dart';
import 'package:easy_commerce/data/models/user.dart';
import 'package:easy_commerce/data/repositories/users_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import '../models/customer.dart';

class AuthenticationRepo {
  static final _firebaseInstance = FirebaseAuth.instance;
  static final _fireStoreInstance = FirebaseFirestore.instance;

  static Future<String> signUp(
      {required String email,
      required String password,
      required String name}) async {
    try {
      Customer customer =
          Customer(name: name, password: password, email: email);
      await _firebaseInstance.createUserWithEmailAndPassword(
          email: email, password: password);
      await _fireStoreInstance.collection('Users').add(customer.toJson());
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          return 'The Email Address Is Already In Use';
        case 'invalid-email':
          return 'The Email Address Is Invalid';
        case 'weak-password':
          return 'The Password Is Too Weak';
        default:
          return '${e.toString()}';
      }
    }
    return "";
  }

  static Future<dynamic> signIn(
      {required String email, required String password}) async {
    User? user;
    try {
      UserCredential userCredential = await _firebaseInstance
          .signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
      final userData = await UsersRepository.getUserDetailsByEmail(email);
      UserModel userModel = UserModel(
          name: userData.name,
          email: email,
          role: userData.role,
          password: password);
      return userModel;
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided.';
      }
    }
  }
}
