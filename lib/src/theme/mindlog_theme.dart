import 'package:flutter/material.dart';
import 'app_colors.dart';

class MindLogTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: 'Inter',
      scaffoldBackgroundColor: AppColors.backgroundWhite,
      colorScheme: const ColorScheme.light().copyWith(
        primary: AppColors.primaryGreen,
        secondary: AppColors.secondaryGreen,
        surface: AppColors.surfaceLight,
        error: AppColors.errorRed,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.textHeader),
        titleTextStyle: TextStyle(color: AppColors.textHeader, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: 'Inter',
      scaffoldBackgroundColor: AppColors.darkBackground,
      colorScheme: const ColorScheme.dark().copyWith(
        primary: AppColors.primaryGreen, 
        secondary: AppColors.secondaryGreen,
        surface: AppColors.darkSurface,
        error: AppColors.errorRed,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.darkTextHeader),
        titleTextStyle: TextStyle(color: AppColors.darkTextHeader, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}