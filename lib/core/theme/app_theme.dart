import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {

  /// ================= LIGHT =================

  static ThemeData lightTheme = ThemeData(

    brightness: Brightness.light,

    scaffoldBackgroundColor:
    AppColors.lightBackground,

    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.accent,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      foregroundColor: AppColors.textPrimary,
    ),

    cardTheme: CardThemeData(
      color: AppColors.lightCard,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
    ),

    elevatedButtonTheme:
    ElevatedButtonThemeData(

      style: ElevatedButton.styleFrom(

        backgroundColor:
        AppColors.primary,

        foregroundColor:
        Colors.white,

        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(14),
        ),
      ),
    ),
  );

  /// ================= DARK =================

  static ThemeData darkTheme = ThemeData(

    brightness: Brightness.dark,

    scaffoldBackgroundColor:
    AppColors.darkBackground,

    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.accent,
    ),

    cardTheme: CardThemeData(
      color: AppColors.darkCard,

      shape: RoundedRectangleBorder(
        borderRadius:
        BorderRadius.circular(18),
      ),
    ),
  );
}