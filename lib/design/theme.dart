import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF333333);
  static const Color githubBlack = Color(0xFF333333);
  static const Color secondaryColor = Color(0xFFF5F5F5);
  static const Color githubCream = Color(0xFFF5F5F5);
  static const Color foregroundColor = Color(0xFFFAFAFA);
  static const Color githubWhite = Color(0xFFFAFAFA);

  static final themeData = ThemeData(
    primaryColor: primaryColor,
    backgroundColor: foregroundColor,
    appBarTheme: AppBarTheme(
      color: primaryColor,
      foregroundColor: foregroundColor,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: secondaryColor,
    ),
  );
}
