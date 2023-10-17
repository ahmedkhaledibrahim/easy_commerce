part of 'wears_bloc.dart';

@immutable
abstract class WearsEvent {}

class RetrieveWearsEvent extends WearsEvent{}

class AddWearEvent extends WearsEvent{
  final Wears wear;
  AddWearEvent({required this.wear});
}
