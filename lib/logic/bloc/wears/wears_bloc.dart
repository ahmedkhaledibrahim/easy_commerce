import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_commerce/data/models/wears.dart';
import 'package:easy_commerce/data/repositories/wears_repo.dart';
import 'package:meta/meta.dart';

part 'wears_event.dart';

part 'wears_state.dart';

class WearsBloc extends Bloc<WearsEvent, WearsState> {
  final WearsRepository wearsRepository;
  List<Wears> listOfMaleWears = [];
  List<Wears> listOfFemaleWears = [];

  WearsBloc(this.wearsRepository) : super(WearsLoading()) {
    on<RetrieveWearsEvent>(_handleRetreiveWearsEvent);
    on<AddWearEvent>(_handleAddWearEvent);
  }

  Future<void> _handleRetreiveWearsEvent(
      RetrieveWearsEvent event, Emitter<WearsState> emit) async {
    try {
      listOfMaleWears = await wearsRepository.getMaleWears();
      listOfFemaleWears = await wearsRepository.getFemaleWears();
      emit(WearsLoaded());
    } catch (e) {
      emit(WearsFailed());
    }
  }

  Future<void> _handleAddWearEvent(
      AddWearEvent event, Emitter<WearsState> emit) async {


    try {
      addProduct(event.wear);

      _handleRetreiveWearsEvent(RetrieveWearsEvent(), emit);
    } catch (e) {
      emit(WearsFailed());
      rethrow;
    }
  }

  Future<void> addProduct(Wears product) async {
    try {
      await WearsRepository().addWearFirestore(product);
    } catch (e) {
      rethrow;
    }
  }
}
