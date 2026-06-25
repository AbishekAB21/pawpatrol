import 'package:flutter/material.dart';
import 'package:pawpatrol/common/resusable_search_box.dart';
import 'package:pawpatrol/core/constants/strings.dart';

class OrdersScreenComponent extends StatelessWidget {
  const OrdersScreenComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.onSurface.withValues(alpha: 0.8),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: Column(
            children: [
              // Title
              Align(
                alignment: AlignmentGeometry.center,
                child: Text(
                  AppStrings.orderHistory,
                  style: theme.textTheme.headlineSmall!.copyWith(
                    color: theme.colorScheme.surface,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              SizedBox(height: 18.0),

              // Search
              ResusableSearchBox(
                hintText: AppStrings.searchYourBowOrders,
                prefixIcon: Icon(
                  Icons.search,
                  color: theme.colorScheme.surface,
                ),

                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("|", style: theme.textTheme.bodyMedium),
                    const SizedBox(width: 5),
                    Icon(Icons.mic_rounded, color: theme.colorScheme.surface),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // Orders (List of Containers)
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(12),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
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
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primary.withValues(
                                  alpha: 0.4,
                                ),
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
                                    color: theme.colorScheme.surface,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        Icon(
                          Icons.more_vert_rounded,
                          color: theme.colorScheme.surface,
                        ),
                      ],
                    ),

                    // Order Card

                    // Reorder | Rate Order Row buttons
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
