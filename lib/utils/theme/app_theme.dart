import 'package:flutter/material.dart';
import 'package:pawpatrol/utils/theme/app_colors.dart';
import 'package:pawpatrol/utils/theme/app_theme_extension.dart';

class AppTheme {
  // =========================
  // DARK THEME
  // =========================

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,

    scaffoldBackgroundColor: AppColors.darkBackground,

    primaryColor: AppColors.primary,
    secondaryHeaderColor: AppColors.secondary,

    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
    ),

    // =========================
    // CUSTOM THEME EXTENSIONS
    // =========================

    extensions: const [

      AppThemeExtension(
        glassBackground: Color(0x1AFFFFFF),
        glassBorder: Color(0x33FFFFFF),
      ),

    ],

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      elevation: 0,
      centerTitle: false,
    ),

    cardColor: AppColors.darkCard,

    dividerColor: AppColors.dividerDark,

    //textTheme: AppTypography.darkTextTheme,

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkSurface,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: Colors.grey,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
    ),
  );

  // =========================
  // LIGHT THEME
  // =========================

  static final lightTheme = ThemeData(
    brightness: Brightness.light,

    scaffoldBackgroundColor: AppColors.lightBackground,

    primaryColor: AppColors.primary,

    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
    ),

    // =========================
    // CUSTOM THEME EXTENSIONS
    // =========================

    extensions: const [

      AppThemeExtension(
        glassBackground: Color(0x66FFFFFF),
        glassBorder: Color(0x1A000000),
      ),

    ],

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightBackground,
      elevation: 0,
      centerTitle: false,
    ),

    cardColor: AppColors.lightCard,

    //textTheme: AppTypography.lightTextTheme,

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: Colors.grey,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
    ),
  );
}

// -------!!!!!!--------
// For normal colors : color: Theme.of(context).primaryColor
// For custom colors : Theme.of(context).extension<AppThemeExtension>()!.glassBackground