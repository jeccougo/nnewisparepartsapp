import 'package:flutter/material.dart';

ThemeData appTheme() => ThemeData(
      primaryColor: Colors.amber,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Urbanist',
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      inputDecorationTheme: inputDecorationTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );



ThemeData lightTheme = ThemeData(
  primaryColor: Colors.amber,
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'Urbanist',
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
  ),
  inputDecorationTheme: inputDecorationTheme(),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

// Define the dark theme
ThemeData darkTheme = ThemeData(
  primaryColor: Colors.amber,
  scaffoldBackgroundColor: Colors.black,
  fontFamily: 'Urbanist',
  appBarTheme: const AppBarTheme(
    color: Colors.black,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  inputDecorationTheme: inputDecorationTheme(),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: const BorderSide(color: Color(0xFF424242)),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}