import 'package:flutter/material.dart';
import 'package:pawpatrol/common/reusable_rounded_button.dart';
import 'package:pawpatrol/features/home%20screen/widgets/header_profile_icon_section.dart';

class HomeHeaderSection extends StatelessWidget {
  final double opacity;

  const HomeHeaderSection({
    super.key,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Opacity(
      opacity: opacity,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          10,
          10,
          10,
          8,
        ),
        child: Column(
          children: [
            Row(
              children: [
                HeaderProfileIconSection(),

                const Spacer(),

                ReusableRoundedButton(
                  icon: Icons.shopping_cart_rounded,
                  color: theme.colorScheme.onSurface,
                  onPressed: () {},
                ),
              ],
            ),

            const SizedBox(height: 10),

            SizedBox(
              height: 100,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      children: [
                        Text(
                          'Everything your pet needs',
                          style: theme.textTheme.bodyLarge!
                              .copyWith(
                                color: theme.colorScheme.onSurface,
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                        ),

                        Text(
                          'at your fingertips.',
                          style: theme.textTheme.bodyLarge!
                              .copyWith(
                                color: theme.colorScheme.onSurface,
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                    right: -10,
                    bottom: 0,
                    child: Image.asset(
                      "assets/images/pet_products.png",
                      width: 220,
                      height: 130,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}