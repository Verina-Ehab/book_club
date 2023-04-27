import 'package:flutter/material.dart';

class MyTheme {
  final Color _green = const Color(0xff91A88D);
  final Color _lightGreen = const Color(0xffBAC8BA);
  final Color _gray = const Color.fromARGB(255, 52, 55, 59);
  final Color _lightGray = const Color.fromARGB(255, 164, 164, 164);
  final Color _white = const Color.fromARGB(255, 255, 255, 255);

  ThemeData buildTheme() {
    return ThemeData(
        canvasColor: _white,
        primaryColor: _green,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: _lightGray),
        secondaryHeaderColor: _gray,
        hintColor: _lightGray,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: _lightGray),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: _lightGreen),
          ),
        ),
        buttonTheme: ButtonThemeData(
            buttonColor: _green,
            padding: EdgeInsets.symmetric(horizontal: 20),
            minWidth: 200,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))));
  }
}
