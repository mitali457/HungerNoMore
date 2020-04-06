import 'package:flutter/material.dart';



final greentheme = ThemeData(
  primarySwatch: Colors.green,
  primaryColor: Colors.green[900],
  brightness: Brightness.light,
  backgroundColor:Colors.green,
  accentColor: Colors.green,
  accentIconTheme: IconThemeData(color: Colors.green),
  dividerColor: Colors.green,
  

);

final darktheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  accentColor: Colors.blueGrey,
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
 
);

final lighttheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.teal,
  brightness: Brightness.light,
  backgroundColor: const Color(0xFFE5E5E5),
  accentColor: Colors.black,
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
 
);