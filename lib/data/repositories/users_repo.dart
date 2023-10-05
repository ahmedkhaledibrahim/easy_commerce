import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_commerce/data/models/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class UsersRepository {
 static final _firestore = FirebaseFirestore.instance;

  static Future<UserModel> getUserDetailsByEmail(String email) async{
    final snapshot = await _firestore.collection("Users").where("email",isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromDocumentSnapshot(e)).single;
    return userData;
  }

 static Future<List<UserModel>> getAllUser() async{
   final snapshot = await _firestore.collection("Users").get();
   final userData = snapshot.docs.map((e) => UserModel.fromDocumentSnapshot(e)).toList();
   return userData;
 }
}
