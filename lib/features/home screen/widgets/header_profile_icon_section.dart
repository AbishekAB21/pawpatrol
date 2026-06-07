import 'package:flutter/material.dart';
import 'package:pawpatrol/utils/theme/app_theme_extension.dart';

class HeaderProfileIconSection extends StatelessWidget {
  const HeaderProfileIconSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppThemeExtension>()!;
    final screenHeight = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(2.0),
          decoration: BoxDecoration(
            color: theme.colorScheme.onSurface,
            shape: BoxShape.circle,
          ),
          child: const CircleAvatar(
            radius: 26.0,
            backgroundImage: AssetImage('assets/images/profile.png'),
          ),
        ),

        const SizedBox(width: 10.0),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi,',
              style: theme.textTheme.bodyMedium!.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),

            Text(
              'Nivi',
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.w700,
                fontSize: 30.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
