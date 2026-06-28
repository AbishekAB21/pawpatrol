import 'package:flutter/material.dart';

class PriceCardRow extends StatelessWidget {
  final String heading;
  final String value;
  final bool? isTotal;
  const PriceCardRow({
    super.key,
    required this.heading,
    required this.value,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          heading,
          style: isTotal!
              ? theme.textTheme.labelLarge!.copyWith(
                  color: theme.colorScheme.surface,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                )
              : theme.textTheme.labelSmall!.copyWith(
                  color: theme.colorScheme.surface.withValues(alpha: 0.5),
                  fontSize: 14,
                ),
        ),

        Text(
          "₹$value",
          style: isTotal!
              ? theme.textTheme.labelLarge!.copyWith(
                  color: theme.colorScheme.error,
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                )
              : theme.textTheme.labelSmall!.copyWith(
                  color: theme.colorScheme.surface,
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                ),
        ),
      ],
    );
  }
}
