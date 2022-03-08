import 'package:flutter/material.dart';

class SweetTheme {
  static Color primaryColor = const Color(0xFFF26674);
  static Color secondaryColor = const Color(0xFFF04E5F);

  static ThemeData get theme => ThemeData(
        primaryColor: primaryColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
          secondary: secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
        ),
      );
}
