import 'package:easy_commerce/data/models/user.dart';

import '../repositories/authentication_repo.dart';

class Customer extends UserModel {
  Customer({
    required super.name,
    required super.password,
    required super.email,
  }) : super(role: 'customer');



  @override
  signIn(String email, String password) async {
    // TODO: implement signIn
    var data =
        await AuthenticationRepo.signIn(email: email, password: password);
    return data;
  }

  signUp(String email, String password, String name) async {
    var data = await AuthenticationRepo.signUp(
        email: email, password: password, name: name);
    return data;
  }
}
