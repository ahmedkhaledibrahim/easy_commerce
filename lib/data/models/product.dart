import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  late final String? id;
  final String imageUrl;
  final String name;
  final String description;
  final double price;
  final int quantity;

  Product({
    required this.description,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.quantity,
    this.id,
  });

  factory Product.fromJson(DocumentSnapshot<Map<String, dynamic>> docSnapshot) {
    final json = docSnapshot.data();
    return Product(
        id: json?['id'],
        name: json?['name'],
        imageUrl: json?['imageUrl'],
        description: json?['description'],
        price: json?['price'],
        quantity: json?['quantity']);
  }

  toJson(){
    return {
      'id' : '',
      'name' : this.name,
      'description' : this.description,
      'price' : this.price,
      'quantity' : this.quantity,
      'imageUrl' : this.imageUrl
    };
  }


}
