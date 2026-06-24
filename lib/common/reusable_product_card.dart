import 'package:flutter/material.dart';
import 'package:pawpatrol/features/home%20screen/core/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onAdd;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const ProductCard({
    super.key,
    required this.product,
    required this.onAdd,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: 110,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              // Square image — width and height match
              Container(
                height: 110,
                width: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: theme.colorScheme.surface.withValues(alpha: 0.5),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(product.image, fit: BoxFit.cover),
              ),

              Positioned(
                right: -4,
                bottom: -4,
                child: product.quantity == 0
                    ? _AddButton(onTap: onAdd)
                    : _QuantityButton(
                        quantity: product.quantity,
                        onIncrement: onIncrement,
                        onDecrement: onDecrement,
                      ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Text(
            product.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 12.0,
              color: theme.colorScheme.surface
            ),
          ),

          const SizedBox(height: 4),

          Row(
            children: [
              Text(
                "₹${product.price.toInt()}",
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                  color: theme.colorScheme.surface
                ),
              ),

              if (product.originalPrice != null) ...[
                const SizedBox(width: 4),

                Text(
                  "₹${product.originalPrice!.toInt()}",
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 10.0,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: theme.colorScheme.surface,
                    color: theme.colorScheme.surface.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

// Add Button

class _AddButton extends StatelessWidget {
  final VoidCallback onTap;

  const _AddButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: theme.colorScheme.onSurface,
            width: 2.0
          )
        ),
        child: Icon(
          Icons.add,
          color: theme.colorScheme.onSurface,
          size: 16,
        ),
      ),
    );
  }
}

// Quantity Button

class _QuantityButton extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const _QuantityButton({
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 30,
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: onDecrement,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 22, minHeight: 22),
            visualDensity: VisualDensity.compact,
            icon: Icon(
              Icons.remove,
              color: theme.colorScheme.onSurface,
              size: 13,
            ),
          ),

          Text(
            quantity.toString(),
            style: TextStyle(
              color: theme.colorScheme.onSurface,
              fontWeight: FontWeight.bold,
              fontSize: 11.0,
            ),
          ),

          IconButton(
            onPressed: onIncrement,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 22, minHeight: 22),
            visualDensity: VisualDensity.compact,
            icon: Icon(
              Icons.add,
              color: theme.colorScheme.onSurface,
              size: 13,
            ),
          ),
        ],
      ),
    );
  }
}