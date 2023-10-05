import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_commerce/data/models/product.dart';
import 'package:easy_commerce/data/repositories/products_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductLoading(listOfProducts: [])) {
    on<ProductEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is RetrieveProductsEvent) {
        try {
          emit(ProductLoading(listOfProducts: []));
          final products = await ProductsRepository.getProducts();
          emit(ProductLoaded(listOfProducts: products));
        } catch (e) {
          emit(ProductFailed(listOfProducts: []));
        }
      }
      if (event is AddProductEvent) {
        try {
          addProduct(event.product);
          emit(ProductLoading(listOfProducts: []));
          final products = await ProductsRepository.getProducts();
          emit(ProductLoaded(listOfProducts: products));
        } catch (e) {
          rethrow;
        }
      }
    });
  }

  Future<void> addProduct(Product product) async {
    try {
      await ProductsRepository.addProductFirestore(product);
    } catch (e) {
      rethrow;
    }
  }
}
