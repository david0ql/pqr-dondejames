import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryColor = const Color(0xFFff94c2);
  static Color secondColor = const Color.fromARGB(255, 247, 87, 156);
  static Color backgroundColor = const Color(0xFFffeeff);
  static ThemeData customTheme = ThemeData.light().copyWith(
    //elevatedButtonTheme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
    ),
    colorScheme: ThemeData().colorScheme.copyWith(primary: primaryColor),
  );
}
