import 'package:flutter/material.dart';
import 'package:pawpatrol/utils/fonts/app_fontstyles.dart';
import 'package:pawpatrol/utils/theme/app_colors.dart';

class AppTypography {
  // =========================
  // DARK TEXT THEME
  // =========================

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: AppFontstyles.headingLarge.copyWith(
      color: AppColors.white,
    ),

    headlineMedium: AppFontstyles.headingMedium.copyWith(
      color: AppColors.white,
    ),

    headlineSmall: AppFontstyles.headingSmall.copyWith(
      color: AppColors.white,
    ),

    bodyLarge: AppFontstyles.bodyLarge.copyWith(
      color: AppColors.lightText,
    ),

    bodyMedium: AppFontstyles.bodyMedium.copyWith(
      color: AppColors.subtitleDark,
    ),

    bodySmall: AppFontstyles.bodySmall.copyWith(
      color: AppColors.subtitleDark,
    ),
  );

  // =========================
  // LIGHT TEXT THEME
  // =========================

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: AppFontstyles.headingLarge.copyWith(
      color: AppColors.darkText,
    ),

    headlineMedium: AppFontstyles.headingMedium.copyWith(
      color: AppColors.darkText,
    ),

    headlineSmall: AppFontstyles.headingSmall.copyWith(
      color: AppColors.darkText,
    ),

    bodyLarge: AppFontstyles.bodyLarge.copyWith(
      color: AppColors.darkText,
    ),

    bodyMedium: AppFontstyles.bodyMedium.copyWith(
      color: AppColors.subtitleLight,
    ),

    bodySmall: AppFontstyles.bodySmall.copyWith(
      color: AppColors.subtitleLight,
    ),
  );
}