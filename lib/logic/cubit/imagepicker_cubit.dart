import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:easy_commerce/data/repositories/images_repo.dart';
import 'package:meta/meta.dart';
import 'package:image_picker/image_picker.dart';

part 'imagepicker_state.dart';

class ImagepickerCubit extends Cubit<ImagepickerState> {
  ImagepickerCubit() : super(ImagepickerInitial());

  final picker = ImagePicker();
  late String _imageUrl;
  late File imageFile;

  Future<void> pickImage() async {
    try{
      var image = await ImagePicker.platform
          .getImageFromSource(source: ImageSource.gallery);
      if (image != null) {
        imageFile = File(image.path);
        emit(Imagepickerloaded(imageFile: imageFile));
      } else {
        emit(Imagepickerfailed(error: "Can't Load Image"));
      }
    }
    catch(e){
      emit(Imagepickerfailed(error: e.toString()));
    }

  }

  Future<String> getImageUrl() async{
    _imageUrl = await ImagesRepository().uploadImage(imageFile);
    return _imageUrl;
  }
}
