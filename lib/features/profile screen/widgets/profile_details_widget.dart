import 'package:flutter/material.dart';

class ProfileCardDetailsWidget extends StatelessWidget {
  final Widget prefixWidget;
  final String cardTitle;
  final String cardSubtitle;
  final Widget? suffixWidget;
  final bool? isRed;
  final bool? showSuffixWidget;
  const ProfileCardDetailsWidget({
    super.key,
    required this.prefixWidget,
    required this.cardTitle,
    required this.cardSubtitle,
    this.suffixWidget,
    this.isRed = false,
    this.showSuffixWidget = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            prefixWidget,
            SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cardTitle,
                  style: theme.textTheme.labelMedium!.copyWith(
                    color: isRed!
                        ? theme.colorScheme.error
                        : theme.colorScheme.surface,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  cardSubtitle,
                  style: theme.textTheme.labelMedium!.copyWith(
                    color: isRed!
                        ? theme.colorScheme.error.withValues(alpha: 0.7)
                        : theme.colorScheme.surface.withValues(alpha: 0.5),
                    letterSpacing: 0,
                  ),
                ),
              ],
            ),
          ],
        ),

        Visibility(
          visible: showSuffixWidget!,
          child: suffixWidget ??
              Icon(
                Icons.arrow_forward_ios,
                color: theme.colorScheme.surface.withValues(alpha: 0.5),
              ),
        ),
      ],
    );
  }
}
