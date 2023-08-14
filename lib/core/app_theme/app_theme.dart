import 'package:flutter/material.dart';

class AppTheme{


static final ThemeData lightTheme=ThemeData(
  primarySwatch: Colors.red,
  hintColor: Colors.blueAccent,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);


static final ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.deepPurple,
  hintColor: Colors.deepPurpleAccent,
  brightness: Brightness.dark,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);






}