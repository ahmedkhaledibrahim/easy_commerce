import 'package:flutter/material.dart';
ThemeData apptheme() {
  return ThemeData(
   appBarTheme: const AppBarTheme(
     centerTitle: true,
     elevation: 0,
     color: Colors.transparent
   ),
   scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Avenir',
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Colors.black,
      elevation: 0,
    ),
    textTheme: TextTheme(
      labelLarge: TextStyle(
        fontFamily: 'Avenir'
      ),
      bodyLarge: TextStyle(
          fontFamily: 'Avenir'
      ),
    ),
  );
}