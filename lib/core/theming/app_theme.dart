import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/core/theming/colors.dart';

class AppTheme {
  static final String? _fontFamily = GoogleFonts.tajawal().fontFamily;

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: Colors.grey.shade50,
    fontFamily: _fontFamily,
    textTheme: GoogleFonts.tajawalTextTheme(ThemeData.light().textTheme),
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryColor,
      secondary: AppColors.primaryColor,
      surface: Colors.white,
      error: Colors.red,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: GoogleFonts.tajawal(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    iconTheme: IconThemeData(color: Colors.grey.shade700),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: GoogleFonts.tajawal(),
      hintStyle: GoogleFonts.tajawal(),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: GoogleFonts.tajawal(),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: GoogleFonts.tajawal(),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    fontFamily: _fontFamily,
    textTheme: GoogleFonts.tajawalTextTheme(ThemeData.dark().textTheme),
    scaffoldBackgroundColor: const Color(0xFF121212),
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryColor,
      secondary: AppColors.primaryColor,
      surface: Color(0xFF1E1E1E),
      error: Colors.red,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF1E1E1E),
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: GoogleFonts.tajawal(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    iconTheme: IconThemeData(color: Colors.grey.shade300),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: GoogleFonts.tajawal(),
      hintStyle: GoogleFonts.tajawal(),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: GoogleFonts.tajawal(),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: GoogleFonts.tajawal(),
      ),
    ),
  );
}
