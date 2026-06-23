import 'package:flutter/material.dart';
import 'package:pawpatrol/utils/theme/app_theme_extension.dart';

class ResubaleProductsSection extends StatelessWidget {
  const ResubaleProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppThemeExtension>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Paws down, these are popular",
          style: theme.textTheme.headlineSmall!.copyWith(
            fontWeight: FontWeight.w800,

            color:  theme.colorScheme.surface
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) => Container(),
        ),
      ],
    );
  }
}
