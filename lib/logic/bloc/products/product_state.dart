part of 'product_bloc.dart';

abstract class ProductState {
  final List<Product> listOfProducts;
  ProductState({required this.listOfProducts});
}

class ProductLoading extends ProductState {
  ProductLoading({required super.listOfProducts});
}

class ProductLoaded extends ProductState {
  ProductLoaded({required super.listOfProducts});
}

class ProductFailed extends ProductState {
  ProductFailed({required super.listOfProducts});
}

