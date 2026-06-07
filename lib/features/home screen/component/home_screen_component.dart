import 'package:flutter/material.dart';
import 'package:pawpatrol/common/reusable_rounded_button.dart';
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
                    onPressed: (){
                      // Navigate to cart screen
                    },
                  ),
                ],
              ),

              // Search bar

              // Categories section

              // Featured products section

              // Popular products section

              // Bottom navigation bar
            ],
          ),
        ),
      ),
    );
  }
}
