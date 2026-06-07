import 'package:flutter/material.dart';

class AppThemeExtension
    extends ThemeExtension<AppThemeExtension> {

  final Color glassBackground;
  final Color glassBorder;

  const AppThemeExtension({
    required this.glassBackground,
    required this.glassBorder,
  });

  @override
  AppThemeExtension copyWith({
    Color? glassBackground,
    Color? glassBorder,
  }) {
    return AppThemeExtension(
      glassBackground:
          glassBackground ?? this.glassBackground,

      glassBorder:
          glassBorder ?? this.glassBorder,
    );
  }

  @override
  AppThemeExtension lerp(
    ThemeExtension<AppThemeExtension>? other,
    double t,
  ) {
    if (other is! AppThemeExtension) {
      return this;
    }

    return AppThemeExtension(
      glassBackground: Color.lerp(
        glassBackground,
        other.glassBackground,
        t,
      )!,

      glassBorder: Color.lerp(
        glassBorder,
        other.glassBorder,
        t,
      )!,
    );
  }
}