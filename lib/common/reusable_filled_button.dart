import 'package:flutter/material.dart';
import 'package:pawpatrol/utils/theme/app_theme_extension.dart';

class ReusableFilledButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? elevation;
  final BorderSide? borderSide;
  final Size? minimumSize;
  final OutlinedBorder? shape;
  final EdgeInsetsGeometry? padding;
  const ReusableFilledButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation,
    this.borderSide,
    this.minimumSize,
    this.shape,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppThemeExtension>()!;

    return Align(
      alignment: Alignment.bottomCenter,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor:
              backgroundColor ??
              theme.colorScheme.primary.withValues(alpha: 0.7),
          foregroundColor: foregroundColor ?? theme.colorScheme.onSurface,
          minimumSize: minimumSize ?? const Size(64, 64),
          shape:
              shape ??
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side:
                    borderSide ?? BorderSide(color: ext.glassBorder, width: 3),
              ),
          elevation: elevation ?? 6,
          
        ),
        child: child,
      ),
    );
  }
}
