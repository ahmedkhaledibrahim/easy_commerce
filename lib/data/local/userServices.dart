import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import '../models/user.dart';

class UserServices {
  static Future authenticationSuccess(UserModel user) async {
    LazyBox authbox = await Hive.openLazyBox('loginStatus');
    LazyBox namebox = await Hive.openLazyBox('userName');
    LazyBox rolebox = await Hive.openLazyBox('userRole');
    await authbox.put('loginStatus', true);
    await namebox.put('userName', user.name);
    await rolebox.put('userRole', user.role);
  }

  static Future<String> getAuthStatus() async {
    LazyBox authbox = await Hive.openLazyBox('loginStatus');
    bool isopen =  authbox.isNotEmpty;
    if(isopen){
      bool auth = await authbox.get('loginStatus');
      if (auth) {
        LazyBox rolebox = await Hive.openLazyBox('userRole');
        String role = await rolebox.get('userRole');
        if (kDebugMode) {
          print(role);
        }
        if (role.isEmpty) {
          role = 'null';
        }
        return role;
      }
    }
    else{
      await authbox.put('loginStatus', false);
    }


    return 'null';
  }

  static Future logout() async {
    LazyBox authbox = await Hive.openLazyBox('loginStatus');
    await authbox.put('loginStatus', false);

    LazyBox namebox = await Hive.openLazyBox('userName');
    await namebox.put('userName', '');

    LazyBox rolebox = await Hive.openLazyBox('userRole');
    await rolebox.put('userRole', 'null');
  }
}
