import 'package:flutter/material.dart';
import 'package:pawpatrol/core/constants/strings.dart';
import 'package:pawpatrol/utils/theme/app_theme_extension.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppThemeExtension>()!;
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(12),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: ext.glassBorder, width: 2),
        color: theme.colorScheme.onSurface,
      ),

      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withValues(alpha: 0.4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.done_rounded,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),

                  SizedBox(width: 10.0),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Delivered on July 3",
                        style: theme.textTheme.bodyLarge!.copyWith(
                          color: theme.colorScheme.surface,

                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        "2,292 ${AppStrings.interpunct} 3 Jul, 11:11 AM",
                        style: theme.textTheme.bodySmall!.copyWith(
                          color: theme.colorScheme.surface.withValues(
                            alpha: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Icon(Icons.more_vert_rounded, color: theme.colorScheme.surface),
            ],
          ),

          SizedBox(height: 12.0),

          // Order Card
          Align(
            alignment: AlignmentGeometry.centerLeft,
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface.withValues(alpha: 0.04),
                borderRadius: BorderRadius.circular(20),
              ),

              child: Image.asset(
                'assets/images/dummy_cat_treats.png',
                width: 40,
              ),
            ),
          ),

          SizedBox(height: 5),

          Divider(color: theme.colorScheme.surface.withValues(alpha: 0.09)),

          // Reorder | Rate Order Row buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                AppStrings.reorder,
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),

              Text(
                AppStrings.sperator,
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.surface.withValues(alpha: 0.2),
                ),
              ),

              Text(
                AppStrings.rateOrder,
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
