
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:firebase_storage/firebase_storage.dart';

class ImagesRepository{
  FirebaseStorage firebaseStorage = FirebaseStorage.instanceFor(bucket: 'gs://easy-commerce-450f1.appspot.com');

  Future<String> uploadImage(File image) async{
    Reference ref = firebaseStorage.ref().child(path.basename(image.path));
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot taskSnapshot = await uploadTask;
    String url = await taskSnapshot.ref.getDownloadURL();
    return url;
  }
}