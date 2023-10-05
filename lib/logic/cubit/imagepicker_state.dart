part of 'imagepicker_cubit.dart';

@immutable
abstract class ImagepickerState {}

class ImagepickerInitial extends ImagepickerState {}

class Imagepickerloaded extends ImagepickerState {
  final File imageFile;

  Imagepickerloaded({required this.imageFile});
}

class Imagepickerfailed extends ImagepickerState {
  final String error;

  Imagepickerfailed({required this.error});
}
