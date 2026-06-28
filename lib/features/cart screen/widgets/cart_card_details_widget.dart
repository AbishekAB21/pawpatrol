import 'package:flutter/material.dart';

class CartCardDetailsWidget extends StatelessWidget {
  final Widget prefixWidget;
  final String productName;
  final String cardSubtitle;
  final String price;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final bool? isRed;

  const CartCardDetailsWidget({
    super.key,
    required this.prefixWidget,
    required this.productName,
    required this.cardSubtitle,
    required this.price,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    this.isRed = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Image with quantity overlay
        prefixWidget,

        const SizedBox(width: 12),

        // Name + subtitle
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      productName,
                      style: theme.textTheme.labelMedium!.copyWith(
                        color: isRed!
                            ? theme.colorScheme.error
                            : theme.colorScheme.surface,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    // Remove botton
                    Icon(
                      Icons.close_rounded,
                      size: 18,
                      color: theme.colorScheme.surface.withValues(alpha: 0.6),
                    ),
                  ],
                ),
                if (cardSubtitle.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    cardSubtitle,
                    style: theme.textTheme.labelSmall!.copyWith(
                      color: isRed!
                          ? theme.colorScheme.error.withValues(alpha: 0.7)
                          : theme.colorScheme.primary,
                      letterSpacing: 0,
                    ),
                  ),
                ],

                SizedBox(height: 10.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Price (suffix)
                    Text(
                      price,
                      style: theme.textTheme.labelLarge!.copyWith(
                        color: theme.colorScheme.surface,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -1,
                        fontSize: 18,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: theme.primaryColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: onDecrement,
                            child: Icon(
                              Icons.remove,
                              color: theme.colorScheme.onSurface,
                              size: 16,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              "$quantity",
                              style: theme.textTheme.labelMedium!.copyWith(
                                color: theme.colorScheme.onSurface,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: onIncrement,
                            child: Icon(
                              Icons.add,
                              color: theme.colorScheme.onSurface,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        const SizedBox(width: 8),
      ],
    );
  }
}
