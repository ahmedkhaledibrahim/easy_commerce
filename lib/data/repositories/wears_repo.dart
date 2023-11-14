import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/wears.dart';

class WearsRepository{
  static final _firestore = FirebaseFirestore.instance;
  static Future<List<Wears>> getProducts() async {
    final snapshot = await _firestore.collection("products/clothes").get();
    final data = snapshot.docs.map((e) => Wears.fromJson(e)).toList();
    return data;
  }
  Future<void> addWearFirestore(Wears product) async {
    try {
      if (product.type == 'clothes' && product.gender == "Male") {
        addMaleClothes(product);
      } else if (product.type == 'clothes' && product.gender == "Female") {
        addFemaleClothes(product);
      } else if (product.type == 'shoes' && product.gender == 'Male') {
        addMaleShoes(product);
      }
      else if (product.type == 'shoes' && product.gender == 'Female') {
        addFemalesShoes(product);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
  addMaleClothes(Wears product) async {
    await _firestore
        .collection("products").doc('clothes').collection("male")
        .add(product.toJson())
        .then((DocumentReference ref) {
      _firestore
          .collection("products").doc('clothes').collection("male")
          .doc(ref.id)
          .update({'id': ref.id});
    });
  }

  addMaleShoes(Wears product) async {
    await _firestore
        .collection("products").doc('clothes').collection("male")
        .add(product.toJson())
        .then((DocumentReference ref) {
      _firestore
          .collection("products").doc('clothes').collection("male")
          .doc(ref.id)
          .update({'id': ref.id});
    });
  }

  addFemaleClothes(Wears product) async {
    await _firestore
        .collection("products").doc('clothes').collection("female")
        .add(product.toJson())
        .then((DocumentReference ref) {
      _firestore
          .collection("products").doc('clothes').collection("female")
          .doc(ref.id)
          .update({'id': ref.id});
    });
  }

  addFemalesShoes(Wears product) async {
    await _firestore
        .collection("products").doc('clothes').collection("female")
        .add(product.toJson())
        .then((DocumentReference ref) {
      _firestore
          .collection("products").doc('clothes').collection("female")
          .doc(ref.id)
          .update({'id': ref.id});
    });
  }

   Future<List<Wears>> getMaleWears() async {
    try{
      final snapshot = await _firestore .collection("products").doc('clothes').collection("male").get();
      final data = snapshot.docs.map((e) => Wears.fromJson(e)).toList();
      print(data.length);
      return data;
    }
    catch(e){
      print(e);
    }
    return[];

  }
  Future<List<Wears>> getFemaleWears() async {
    try{
      final snapshot = await _firestore .collection("products").doc('clothes').collection("female").get();
      final data = snapshot.docs.map((e) => Wears.fromJson(e)).toList();
      print(data.length);
      return data;
    }
    catch(e){
      print(e);
    }
    return[];

  }
}