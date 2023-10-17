part of 'wears_bloc.dart';

@immutable
abstract class WearsState {
  final List<Wears> listOfWears;
  WearsState({required this.listOfWears});
}

class WearsLoading extends WearsState {
  WearsLoading({required super.listOfWears});
}

class WearsLoaded extends WearsState{
  WearsLoaded({required super.listOfWears});

}
class WearsFailed extends WearsState{
WearsFailed({required super.listOfWears});
}
