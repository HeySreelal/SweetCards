import 'dart:math';

import 'package:flutter/material.dart';

class SweetTheme {
  static Color primaryColor = const Color(0xFFF04E5F);
  static Color secondaryColor = const Color(0xFFF26674);
  static Color white = Colors.white;

  static ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: SweetTheme.primaryColor,
        colorScheme: ColorScheme.light(
          primary: SweetTheme.primaryColor,
          secondary: SweetTheme.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
        ),
        textTheme: const TextTheme(
          headline3: TextStyle(
            fontSize: 54,
            color: Colors.white,
          ),
          bodyText1: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
          bodyText2: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        iconTheme: IconThemeData(
          color: SweetTheme.primaryColor,
        ),
      );

  static Color navy = const Color(0xFF2C384A);
  static Color sapphire = const Color(0xFF0E185F);
  static Color wisteria = const Color(0xFFD18CE0);
  static Color bostonBlue = const Color(0xFF488FB1);
  static Color oxfordBlue = const Color(0xFF203239);
  static Color silverTree = const Color(0xFF65C18C);
  static Color brinkPink = const Color(0xFFFF5C8D);

  static List<Color> cardColors = [
    primaryColor,
    navy,
    sapphire,
    wisteria,
    bostonBlue,
    oxfordBlue,
    silverTree,
    brinkPink,
  ];

  static Color get randomColor =>
      cardColors[Random().nextInt(cardColors.length)];
}
