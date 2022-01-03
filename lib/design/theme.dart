
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
      dividerTheme: DividerThemeData(
        color: primaryColor,
        thickness: 1.0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          gapPadding: 0.0,
        ),
        focusColor: primaryColor,
        isDense: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
          ),
          gapPadding: 0.0,
        ),
        counterStyle: TextStyle(
          color: primaryColor,
        ),
        helperStyle: TextStyle(
          color: primaryColor,
        ),
        fillColor: primaryColor,
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: primaryColor,
      ),
      listTileTheme: ListTileThemeData(
        selectedColor: primaryColor,
        selectedTileColor: primaryColor,
        contentPadding: EdgeInsets.all(8.0),
        style: ListTileStyle.list,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: primaryColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(primaryColor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder()),
        ),
      ));
}
