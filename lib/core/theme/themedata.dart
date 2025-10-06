import 'package:evently_app/core/theme/appcolors.dart';
import 'package:flutter/material.dart';

abstract class apptheme {
  static ThemeData light = ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: Color(0xff7B7B7B),
      suffixIconColor: Color(0xff7B7B7B),

      labelStyle: TextStyle(
        color: Color(0xff7B7B7B),
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      contentPadding: EdgeInsets.all(4),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 1.5),
        borderRadius: BorderRadius.circular(24),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 1.5),
        borderRadius: BorderRadius.circular(24),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 1.5),
        borderRadius: BorderRadius.circular(24),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Appcolors.red, width: 1.5),
        borderRadius: BorderRadius.circular(24),
      ),
    ),
    scaffoldBackgroundColor: Appcolors.light,
    fontFamily: 'JockeyOne',
    primaryColor: Appcolors.primary,
    textTheme: TextTheme(
      bodySmall: TextStyle(
        fontSize: 12,
        color: Appcolors.black,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        fontSize: 18,
        color: Appcolors.black,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        fontSize: 24,
        color: Appcolors.black,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        fontSize: 32,
        color: Appcolors.primary,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: 28,
        color: Appcolors.primary,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        fontSize: 24,
        color: Appcolors.primary,
        fontWeight: FontWeight.w600,
      ),
      displayMedium: TextStyle(
        color: Appcolors.primary,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
  static ThemeData dark = ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: Color(0xffF4EBDC),
      suffixIconColor: Color(0xffF4EBDC),
      labelStyle: TextStyle(
        color: Color(0xffF4EBDC),
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      contentPadding: EdgeInsets.all(4),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Appcolors.primary, width: 1.5),
        borderRadius: BorderRadius.circular(24),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Appcolors.primary, width: 1.5),
        borderRadius: BorderRadius.circular(24),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Appcolors.primary, width: 1.5),
        borderRadius: BorderRadius.circular(24),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Appcolors.red, width: 1.5),
        borderRadius: BorderRadius.circular(24),
      ),
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(
        fontSize: 12,
        color: Appcolors.light,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        fontSize: 18,
        color: Appcolors.light,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        fontSize: 24,
        color: Appcolors.light,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        fontSize: 32,
        color: Appcolors.primary,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: 28,
        color: Appcolors.primary,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        fontSize: 24,
        color: Appcolors.primary,
        fontWeight: FontWeight.w600,
      ),
      displayMedium: TextStyle(
        color: Appcolors.primary,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ),

    scaffoldBackgroundColor: Appcolors.dark,
    fontFamily: 'JockeyOne',
    primaryColorDark: Appcolors.primary,
  );
}
