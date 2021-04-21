import 'package:flutter/material.dart';

final kDarkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.blue[900],
    ));

final kLightTheme = ThemeData.light().copyWith(
  primaryTextTheme: TextTheme(
    headline6: TextStyle(
        color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold),
  ),
  textTheme: TextTheme(
    headline6: TextStyle(
        color: Colors.blue[900], fontSize: 18.0, fontWeight: FontWeight.bold),
    bodyText1: TextStyle(
        color: Colors.red, fontSize: 16.0, fontWeight: FontWeight.bold),
    bodyText2: TextStyle(color: Colors.black, fontSize: 16.0),
  ),
  scaffoldBackgroundColor: Colors.blue[100],
  primaryColor: Colors.blue[900],
  cardColor: Colors.blue[50],
  iconTheme: IconThemeData(color: Colors.blue[600]),
  primaryIconTheme: IconThemeData(color: Colors.red),
  accentIconTheme: IconThemeData(color: Colors.green[900]),
);
