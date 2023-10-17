import 'package:easy_commerce/presentation/screens/adminAddProduct_screen.dart';
import 'package:easy_commerce/presentation/screens/adminHome_screen.dart';
import 'package:easy_commerce/presentation/screens/authentication_screen.dart';
import 'package:easy_commerce/presentation/screens/cart_screen.dart';
import 'package:easy_commerce/presentation/screens/home_screen.dart';
import 'package:easy_commerce/presentation/screens/initialScreen.dart';

import 'package:easy_commerce/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (BuildContext context) => InitialScreen(),
  '/home': (BuildContext context) => HomeScreen(),
  '/adminhome': (BuildContext context) => AdminHomeScreen(),
  '/adminaddproduct': (BuildContext context) => AdminAddProductScreen(),
  '/authentication': (BuildContext context) => AuthenticationScreen(),
  '/cart': (BuildContext context) => CartScreen(),
  '/profile': (BuildContext context) => ProfileScreen(),
};
