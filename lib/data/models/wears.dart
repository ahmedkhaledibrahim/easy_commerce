
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_commerce/data/models/product.dart';

class Wears extends Product {
  final String type;
  final List<dynamic> sizes;
  final List<dynamic> colors;
  final String? gender;

  Wears({
    super.id,
    required super.description,
    required super.name,
    required super.imageUrl,
    required super.price,
    required super.quantity,
    required this.type,
    required this.gender,
    required this.colors,
    required this.sizes,

  });


  factory Wears.fromJson(DocumentSnapshot<Map<String, dynamic>> docSnapshot) {
    final json = docSnapshot.data();
    return Wears(
        type: json?['type'],
        gender: json?['gender'],
        id: json?['id'],
        name: json?['name'],
        imageUrl: json?['imageUrl'],
        description: json?['description'],
        price: json?['price'],
        quantity: json?['quantity'],
        sizes:json?['sizes'],
        colors: json?['colors']);
  }

  toJson() {
    return {
      'id': '',
      'name': name,
      'description': description,
      'price': price,
      'quantity': quantity,
      'imageUrl': imageUrl,
      'type': type,
      'sizes': sizes,
      'colors': colors,
      'gender': gender,
    };
  }
}