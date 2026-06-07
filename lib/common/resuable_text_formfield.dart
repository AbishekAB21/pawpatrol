import 'package:flutter/material.dart';
import 'package:pawpatrol/utils/theme/app_theme_extension.dart';

class ResuableTextFormfield extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextEditingController? controller;
  const ResuableTextFormfield({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppThemeExtension>()!;

    return TextFormField(
      controller:  controller,
      cursorColor: ext.glassBorder,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefixIcon,
          color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
        ),

        hintText: hintText,
        hintFadeDuration: Duration(milliseconds: 500),
        filled: true,
        fillColor: ext.glassBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: ext.glassBorder, width: 2.5),
        ),
      ),
    );
  }
}
