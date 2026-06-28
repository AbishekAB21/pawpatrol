import 'package:flutter/material.dart';
import 'package:pawpatrol/common/reusable_rounded_button.dart';

class PromoCodeTextfieldWidget extends StatelessWidget {
  final String hintText;
  final void Function()? onPressed;
  const PromoCodeTextfieldWidget({
    super.key,
    required this.hintText,
    this.onPressed,
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
                isDense: true,
                hintText: hintText,
                hintStyle: theme.textTheme.bodyMedium!.copyWith(
                  color: theme.colorScheme.surface,
                ),

                filled: true,
                fillColor: theme.colorScheme.onSurface.withValues(
                  alpha: 0.15,
                ), // more transparent fill
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    color: theme.colorScheme.surface.withValues(alpha: 0.2),
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    color: theme.colorScheme.primary,
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),
        ),

        SizedBox(width: 5.0),

        ReusableRoundedButton(
          icon: Icons.done_rounded,
          color: theme.colorScheme.surface,
          borderColor: theme.colorScheme.surface.withValues(alpha: 0.2),
          onPressed: onPressed,
        ),
      ],
    );
  }
}
