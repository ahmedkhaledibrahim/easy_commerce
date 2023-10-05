import 'package:easy_commerce/data/models/user.dart';

import '../repositories/authentication_repo.dart';

class Admin extends UserModel {
  Admin({required super.name, required super.password, required super.email})
      : super(role: 'admin');

  @override
  signIn(String email, String password) async {
    // TODO: implement signIn
    var data =
        await AuthenticationRepo.signIn(email: email, password: password);
    return data;
  }
}
