// import 'package:cloud_firestore/cloud_firestore.dart';
//
//
// import 'package:easy_commerce/data/models/product.dart';
//
//
//
// class ProductsRepository {
//   static final _firestore = FirebaseFirestore.instance;
//
//   // static Future<List<Product>> getProducts() async {
//   //   List<Product> listOfProducts = [];
//   //   final dio = Dio();
//   //   try {
//   //     final Response response = await dio.get(
//   //         'https://easy-commerce-450f1-default-rtdb.firebaseio.com/products.json');
//   //     if (kDebugMode) {
//   //       print(response.statusCode);
//   //     }
//   //     if (response.statusCode == 200) {
//   //      Map<String,dynamic> data = response.data;
//   //       if (kDebugMode) {
//   //         print(data);
//   //       }
//   //       data.forEach((key, value) {
//   //         listOfProducts.add(Product.fromJson(value));
//   //       });
//   //     }
//   //     return listOfProducts;
//   //   } catch (e) {
//   //     rethrow;
//   //   }
//   // }
//   static Future<List<Product>> getProducts() async {
//     final snapshot = await _firestore.collection("products").get();
//     final data = snapshot.docs.map((e) => Product.fromJson(e)).toList();
//     return data;
//   }
//
//   // getProductsforCategory(Category category) {}
//
//   // static Future<void> addProduct() async {
//   //   try {
//   //     final newKey = _firedatabase.child('products').push().key?.substring(1);
//   //     _firedatabase.child('$newKey').set({
//   //       'id': newKey,
//   //       'name': 'shoes',
//   //       'imageUrl': 'https://image.goxip.com/mpOHDiLwCwU8NUVPXnmqP6HavCQ=/fit-in/500x500/filters:format(jpg):quality(80):fill(white)/https:%2F%2Fcdn-images.farfetch-contents.com%2F14%2F08%2F89%2F05%2F14088905_18503305_1000.jpg',
//   //       'quantity': 50,
//   //       'price': 50.5,
//   //     });
//   //   } catch (e) {
//   //     throw Exception(e.toString());
//   //   }
//   // }
//   //
//
//   Future<void> addProductFirestore(Product product) async {
//     try {
//       if (product.type == 'clothes' && product.gender == "Male") {
//         addMaleClothes(product);
//       } else if (product.type == 'clothes' && product.gender == "Female") {
//         addFemaleClothes(product);
//       } else if (product.type == 'shoes' && product.gender == 'Male') {
//         addMaleShoes(product);
//       }
//       else if (product.type == 'shoes' && product.gender == 'Female') {
//         addFemalesShoes(product);
//       }
//     } catch (e) {
//       throw Exception(e.toString());
//     }
//   }
//
//   addMaleClothes(Product product) async {
//     await _firestore
//         .collection("products/clothes/male")
//         .add(product.toJson())
//         .then((DocumentReference ref) {
//       _firestore
//           .collection("products/clothes/male")
//           .doc(ref.id)
//           .update({'id': ref.id});
//     });
//   }
//
//   addMaleShoes(Product product) async {
//     await _firestore
//         .collection("products/shoes/male")
//         .add(product.toJson())
//         .then((DocumentReference ref) {
//       _firestore
//           .collection("products/shoes/male")
//           .doc(ref.id)
//           .update({'id': ref.id});
//     });
//   }
//
//   addFemaleClothes(Product product) async {
//     await _firestore
//         .collection("products/clothes/female")
//         .add(product.toJson())
//         .then((DocumentReference ref) {
//       _firestore
//           .collection("products/clothes/female")
//           .doc(ref.id)
//           .update({'id': ref.id});
//     });
//   }
//
//   addFemalesShoes(Product product) async {
//     await _firestore
//         .collection("products/shoes/female")
//         .add(product.toJson())
//         .then((DocumentReference ref) {
//       _firestore
//           .collection("products/shoes/female")
//           .doc(ref.id)
//           .update({'id': ref.id});
//     });
//   }
// }
