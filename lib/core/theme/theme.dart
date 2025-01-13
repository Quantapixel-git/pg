import 'package:flutter/material.dart';
import 'package:pg/core/theme/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData.light(useMaterial3: true).copyWith(
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.primary,
    ),
    navigationBarTheme: NavigationBarThemeData(
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      elevation: 2,
      backgroundColor: AppColors.white,
      indicatorColor: AppColors.primary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: AppColors.primary.withValues(alpha: 0.4),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: AppColors.primary.withValues(alpha: 0.4),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(color: AppColors.primary, width: 2),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        backgroundColor: AppColors.primary,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        foregroundColor: AppColors.white,
        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
