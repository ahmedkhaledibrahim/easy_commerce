abstract class Product {
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
}
