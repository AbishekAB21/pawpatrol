import 'package:flutter/material.dart';
import 'package:pawpatrol/utils/theme/app_theme_extension.dart';

class ReusableRoundedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData icon;
  final double size;
  final Color color;
  final Color? borderColor;
  final Color? backgroundColor;
  const ReusableRoundedButton({
    super.key,
    this.onPressed,
    required this.icon,
    this.size = 20.0,
    required this.color,
    this.borderColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppThemeExtension>()!;
    return Material(
      color: ext.glassBackground,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onPressed,
        splashColor: ext.glassBorder.withValues(alpha: 0.5),
        customBorder: const CircleBorder(),
        child: Container(
          padding: const EdgeInsets.all(10.0),

          decoration: BoxDecoration(
            color: backgroundColor ?? ext.glassBackground,
            shape: BoxShape.circle,
            border: Border.all(color: borderColor ?? ext.glassBorder, width: 2.0),
          ),

          child: Icon(icon, size: size, color: color),
        ),
      ),
    );
  }
}
