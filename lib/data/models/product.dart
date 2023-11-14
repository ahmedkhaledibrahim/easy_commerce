abstract class Product {
  late final String? _id;
  final String imageUrl;

  late final String _name;
  late final String _description;
  late final double _price;
  late final int _quantity;

  Product({
    required String description,
    required String name,
    required this.imageUrl,
    required double price,
    required int quantity,
    String? id,
  }){
    _id = id;
    _price = price;
    _quantity = quantity;
    _name = name;
    _description = description;
  }

  String? get id{
    return _id;
  }

  String get name{
    return _name;
  }

  String get description{
    return _description;
  }

  double get price{
    return _price;
  }
  int get quantity{
    return _quantity;
  }
}
