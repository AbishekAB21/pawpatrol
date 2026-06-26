import 'package:flutter/material.dart';
import 'package:pawpatrol/utils/theme/app_theme_extension.dart';

class ProfileCard extends StatelessWidget {

  final Widget profilecarddetails;
  const ProfileCard({super.key, required this.profilecarddetails});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppThemeExtension>()!;
    return Material(
      shadowColor: theme.colorScheme.surface.withValues(alpha: 0.7),
      elevation: 3,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(12.0),

        decoration: BoxDecoration(
          color: theme.colorScheme.onSurface,
          borderRadius: BorderRadius.circular(20),
        ),

        child: profilecarddetails,
      ),
    );
  }
}
