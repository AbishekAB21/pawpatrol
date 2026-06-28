import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pawpatrol/common/reusable_rounded_button.dart';
import 'package:pawpatrol/features/cart%20screen/widgets/cart_card_container_widget.dart';
import 'package:pawpatrol/features/cart%20screen/widgets/cart_card_details_widget.dart';
import 'package:pawpatrol/features/cart%20screen/widgets/price_card_row.dart';
import 'package:pawpatrol/features/cart%20screen/widgets/promo_code_textfield_widget.dart';
import 'package:pawpatrol/routes/app_route_paths.dart';
import 'package:pawpatrol/utils/theme/app_theme_extension.dart';

class CartScreenComponent extends StatefulWidget {
  const CartScreenComponent({super.key});

  @override
  State<CartScreenComponent> createState() => _CartScreenComponentState();
}

class _CartScreenComponentState extends State<CartScreenComponent> {
  final List<int> _quantities = [1, 1, 1];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppThemeExtension>()!;

    return Scaffold(
      extendBody: true, // KEY: lets content bleed under the bottom bar
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(10, 16, 10, 8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              theme.primaryColor,
              theme.colorScheme.secondary.withValues(alpha: 0.9),
              theme.colorScheme.secondary,
            ],
            stops: const [0.0, 0.4, 1.0],
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            // Extra bottom padding so content isn't hidden behind the bar
            padding: const EdgeInsets.only(bottom: 120),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableRoundedButton(
                      icon: Icons.arrow_back_rounded,
                      color: theme.colorScheme.onSurface,
                      onPressed: () => context.pop(),
                    ),
                    Text(
                      "Cart",
                      style: theme.textTheme.titleLarge!.copyWith(
                        color: theme.colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    ReusableRoundedButton(
                      icon: Icons.favorite_rounded,
                      color: theme.colorScheme.onSurface,
                      onPressed: () => context.push(AppRoutesPaths.wishlist),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                CartCardContainerWidget(
                  cartCardContainerWidgetdetails: ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero, 
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _quantities.length,
                    separatorBuilder: (context, index) => Divider(
                      color: theme.colorScheme.surface.withValues(alpha: 0.1),
                    ),
                    itemBuilder: (context, index) {
                      return CartCardDetailsWidget(
                        prefixWidget: Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: theme.colorScheme.surface.withValues(
                              alpha: 0.05,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: SizedBox(
                              width: 80,
                              height: 80,
                              child: Image.asset(
                                "assets/images/dummy_cat_treats.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        productName: "Whiskas Cat Treats",
                        cardSubtitle: "In stock",
                        price: "₹599",
                        quantity: _quantities[index],
                        onIncrement: () => setState(() => _quantities[index]++),
                        onDecrement: () {
                          if (_quantities[index] > 1) {
                            setState(() => _quantities[index]--);
                          }
                        },
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Apply Coupons",
                        style: theme.textTheme.labelLarge!.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 12),
                      PromoCodeTextfieldWidget(hintText: "Enter Coupon Code"),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                CartCardContainerWidget(
                  cartCardContainerWidgetdetails: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Order Summary",
                        style: theme.textTheme.labelLarge!.copyWith(
                          color: theme.colorScheme.surface,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 16),
                      PriceCardRow(heading: "Subtotal", value: "1797.00"),
                      const SizedBox(height: 12),
                      PriceCardRow(heading: "Shipping", value: "30.00"),
                      const SizedBox(height: 12),
                      PriceCardRow(heading: "Coupon Discount", value: "0.00"),
                      const SizedBox(height: 12),
                      PriceCardRow(heading: "Tax", value: "10.00"),
                      const SizedBox(height: 12),
                      Divider(
                        color: theme.colorScheme.surface.withValues(
                          alpha: 0.07,
                        ),
                      ),
                      const SizedBox(height: 12),
                      PriceCardRow(
                        isTotal: true,
                        heading: "Total",
                        value: "1807.00",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // ── Liquid Glass Bottom Bar ──────────────────────────────────────────
      bottomNavigationBar: _LiquidGlassCheckoutBar(
        totalAmount: "₹1,807.00",
        onCheckout: () {
          // TODO: navigate to checkout
        },
      ),
    );
  }
}

// ── Liquid Glass widget — self-contained so it's easy to reuse ─────────────
class _LiquidGlassCheckoutBar extends StatelessWidget {
  final String totalAmount;
  final VoidCallback onCheckout;

  const _LiquidGlassCheckoutBar({
    required this.totalAmount,
    required this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return ClipRect(
      child: BackdropFilter(
        // Heavy blur — this is what makes content underneath look liquid/frosted
        filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 14, 20, 14 + bottomPadding),
          decoration: BoxDecoration(
            // Very subtle white tint — keeps it glassy, not opaque
            color: theme.colorScheme.onSurface.withValues(alpha: 0.08),
            border: Border(
              top: BorderSide(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.18),
                width: 0.8,
              ),
            ),
          ),
          child: Row(
            children: [
              // Total label + amount
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total Payable",
                    style: theme.textTheme.labelSmall!.copyWith(
                      color: theme.colorScheme.surface.withValues(alpha: 0.6),
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    totalAmount,
                    style: theme.textTheme.titleMedium!.copyWith(
                      color: theme.colorScheme.surface,
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 20),

              // Checkout button
              Expanded(
                child: GestureDetector(
                  onTap: onCheckout,
                  child: Container(
                    height: 52,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withValues(alpha: 0.92),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: 0.25,
                          ),
                          blurRadius: 16,
                          spreadRadius: 0,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Checkout",
                      style: theme.textTheme.labelLarge!.copyWith(
                        color: theme.colorScheme.onSurface,
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
