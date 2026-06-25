import 'package:flutter/material.dart';
import 'package:pawpatrol/common/resusable_search_box.dart';
import 'package:pawpatrol/core/constants/strings.dart';
import 'package:pawpatrol/features/orders%20screen/widgets/order_card.dart';
import 'package:pawpatrol/utils/theme/app_theme_extension.dart';

class OrdersScreenComponent extends StatelessWidget {
  const OrdersScreenComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppThemeExtension>()!;
    return Scaffold(
      backgroundColor: theme.colorScheme.onSurface.withValues(alpha: 0.88),

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

              // Orders TODO: (Replace with list of Order cards)
              OrderCard(),

              SizedBox(height: 15.0,),

              OrderCard(),
            ],
          ),
        ),
      ),
    );
  }
}
