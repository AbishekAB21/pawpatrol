import 'package:flutter/material.dart';
import 'package:pawpatrol/common/resubale_products_section.dart';
import 'package:pawpatrol/common/resusable_search_box.dart';
import 'package:pawpatrol/common/reusable_rounded_button.dart';
import 'package:pawpatrol/features/home%20screen/core/category_tab_data.dart';
import 'package:pawpatrol/features/home%20screen/widgets/category_tab.dart';
import 'package:pawpatrol/features/home%20screen/widgets/header_profile_icon_section.dart';

class HomeScreenComponent extends StatelessWidget {
  const HomeScreenComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final ext = theme.extension<AppThemeExtension>()!;
    // final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              theme.primaryColor,
              theme.colorScheme.secondary.withValues(alpha: 0.8),
              theme.colorScheme.secondary,
            ],
            stops: [0.0, 0.4, 1.0],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 60.0),
          child: Column(
            children: [
              // header buttons
              Row(
                children: [
                  HeaderProfileIconSection(),

                  const Spacer(),

                  ReusableRoundedButton(
                    icon: Icons.shopping_cart_rounded,
                    color: theme.colorScheme.onSurface,
                    onPressed: () {
                      // Navigate to cart screen
                    },
                  ),
                ],
              ),

              // Replace the General Text Section Row with this:
              const SizedBox(height: 10.0),
              SizedBox(
                height: 100, // control the section height
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Text aligned to left, vertically centered
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Everything your pet needs',
                            style: theme.textTheme.bodyLarge!.copyWith(
                              color: theme.colorScheme.onSurface,
                              fontWeight: FontWeight.w700,
                              fontSize: 18.0,
                            ),
                          ),
                          Text(
                            'at your fingertips.',
                            style: theme.textTheme.bodyLarge!.copyWith(
                              color: theme.colorScheme.onSurface,
                              fontWeight: FontWeight.w700,
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Image pinned to the right, bottom-aligned with "at your fingertips"
                    Positioned(
                      right:
                          -10, // negative value pushes it past the padding edge
                      bottom: 0, // aligns image bottom with text bottom
                      child: Image.asset(
                        "assets/images/pet_products.png",
                        width: 220,
                        height:
                            130, // taller than the Stack so it visually overlaps upward
                        fit: BoxFit.contain,
                        alignment: Alignment.bottomRight,
                      ),
                    ),
                  ],
                ),
              ),

              // Search bar
              ResusableSearchBox(
                hintText: "Search \"Royal Canine\"",
                prefixIcon: Icon(
                  Icons.search_rounded,
                  color: theme.colorScheme.surface,
                ),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "|",
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: theme.colorScheme.surface.withValues(alpha: 0.6),
                      ),
                    ),

                    SizedBox(width: 5.0),

                    Icon(Icons.mic_rounded, color: theme.colorScheme.surface),
                  ],
                ),
              ),

              // Categories Tabs section
              const SizedBox(height: 10.0),
                CategoryTabsSection(items: CategoryTabsData.items(context)),

              // Popular products section
              SizedBox(height: 20.0),
              const ResubaleProductsSection(),

              // Products on sale section

              // New arrivals section

              // Recommended products section

              // Specific product section (e.g., Accesories, Food, Medicine, etc.)

              // Bottom navigation bar
            ],
          ),
        ),
      ),
    );
  }
}
