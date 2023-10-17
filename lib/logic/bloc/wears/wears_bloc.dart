import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_commerce/data/models/wears.dart';
import 'package:easy_commerce/data/repositories/wears_repo.dart';
import 'package:meta/meta.dart';

part 'wears_event.dart';

part 'wears_state.dart';

class WearsBloc extends Bloc<WearsEvent, WearsState> {
  WearsBloc() : super(WearsLoading(listOfWears: [])) {
    on<WearsEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is RetrieveWearsEvent) {
        try {
          emit(WearsLoading(listOfWears: []));
          final products = await WearsRepository.getProducts();
          emit(WearsLoaded(listOfWears: products));
        } catch (e) {
          emit(WearsFailed(listOfWears: []));
        }
      }
      if (event is AddWearEvent) {
        try {
          addProduct(event.wear);
          emit(WearsLoading(listOfWears: []));
          final products = await WearsRepository.getProducts();
          emit(WearsLoaded(listOfWears: products));
        } catch (e) {
          rethrow;
        }
      }
    });
  }

  Future<void> addProduct(Wears product) async {
    try {
      await WearsRepository().addWearFirestore(product);
    } catch (e) {
      rethrow;
    }
  }
}
