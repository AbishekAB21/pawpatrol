import 'package:flutter/material.dart';

class ResusableSearchBox extends StatelessWidget {
  final String hintText;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final Widget? filterButton;
  const ResusableSearchBox({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.suffixIcon,
    this.filterButton,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.onSurface.withValues(
                    alpha: 0.3,
                  ), // subtle white glow
                  blurRadius: 12,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: theme.textTheme.bodyMedium!.copyWith(
                  color: theme.colorScheme.surface,
                ),
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                filled: true,
                fillColor: theme.colorScheme.onSurface.withValues(
                  alpha: 0.15,
                ), // more transparent fill
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    color: theme.colorScheme.onSurface.withValues(
                      alpha: 0.6,
                    ), // bright white border
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    color: theme.colorScheme.onSurface.withValues(
                      alpha: 0.9,
                    ), // brighter when focused
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
