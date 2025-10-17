import 'package:evently_app/core/theme/appcolors.dart';
import 'package:flutter/material.dart';

abstract class apptheme {
  static ThemeData light = ThemeData(
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,

      iconTheme: IconThemeData(color: Appcolors.primary),
      centerTitle: true,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Appcolors.primary,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(size: 32),
      backgroundColor: Appcolors.primary,
      unselectedItemColor: Appcolors.light,
      selectedItemColor: Appcolors.light,
    ),
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: Color(0xff7B7B7B),
      suffixIconColor: Color(0xff7B7B7B),

      labelStyle: TextStyle(
        color: Color(0xff7B7B7B),
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      hintStyle: TextStyle(
        color: Color(0xff7B7B7B),
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      contentPadding: EdgeInsets.all(4),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 1.5),
        borderRadius: BorderRadius.circular(16),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 1.5),
        borderRadius: BorderRadius.circular(16),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 1.5),
        borderRadius: BorderRadius.circular(16),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Appcolors.red, width: 1.5),
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    scaffoldBackgroundColor: Appcolors.light,

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
      labelMedium: TextStyle(
        color: Appcolors.primary,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
  );
  static ThemeData dark = ThemeData(
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: Appcolors.primary),
      centerTitle: true,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Appcolors.dark,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(size: 32),
      backgroundColor: Appcolors.dark,
      unselectedItemColor: Appcolors.light,
      selectedItemColor: Appcolors.light,
    ),
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: Color(0xffF4EBDC),
      suffixIconColor: Color(0xffF4EBDC),
      labelStyle: TextStyle(
        color: Color(0xffF4EBDC),
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      hintStyle: TextStyle(
        color: Color(0xffF4EBDC),
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      contentPadding: EdgeInsets.all(4),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Appcolors.primary, width: 1.5),
        borderRadius: BorderRadius.circular(16),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Appcolors.primary, width: 1.5),
        borderRadius: BorderRadius.circular(16),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Appcolors.primary, width: 1.5),
        borderRadius: BorderRadius.circular(16),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Appcolors.red, width: 1.5),
        borderRadius: BorderRadius.circular(16),
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
        color: Appcolors.dark,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: TextStyle(
        color: Appcolors.dark,
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    ),

    scaffoldBackgroundColor: Appcolors.dark,

    primaryColorDark: Appcolors.primary,
  );
}
