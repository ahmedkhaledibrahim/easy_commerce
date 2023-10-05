part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class RetrieveProductsEvent extends ProductEvent{}

class AddProductEvent extends ProductEvent{
  final Product product;
  AddProductEvent({required this.product});
}
