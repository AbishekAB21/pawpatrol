import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pawpatrol/utils/theme/app_theme_extension.dart';
import 'package:pawpatrol/core/bloc/home%20screen/category%20tab/category_tab_bloc.dart';
import 'package:pawpatrol/core/bloc/home%20screen/category%20tab/category_tab_event.dart';
import 'package:pawpatrol/core/bloc/home%20screen/category%20tab/category_tab_state.dart';

/// Data for a single category tab (icon + label).
class CategoryTabItem {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const CategoryTabItem({required this.icon, required this.label, this.onTap});
}

/// Horizontally scrollable row of icon + label tabs with a sliding
/// selection indicator that animates between tabs (Material TabBar-style).
///
/// Expects a [CategoryTabBloc] to already be provided above it in the
/// widget tree (e.g. via MultiBlocProvider in the home screen).
class CategoryTabsSection extends StatelessWidget {
  final List<CategoryTabItem> items;
  final double itemWidth;
  final double indicatorWidth;
  final double indicatorHeight;

  const CategoryTabsSection({
    super.key,
    required this.items,
    this.itemWidth = 76.0,
    this.indicatorWidth = 28.0,
    this.indicatorHeight = 3.0,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppThemeExtension>()!;

    return SizedBox(
      height: 90,
      child: BlocBuilder<CategoryTabBloc, CategoryTabState>(
        builder: (context, state) {
          final selectedIndex = state.selectedIndex;

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // Tab items
                Row(
                  children: List.generate(items.length, (index) {
                    final item = items[index];
                    final isSelected = index == selectedIndex;

                    return GestureDetector(
                      onTap: () {
                        context
                            .read<CategoryTabBloc>()
                            .add(CategoryTabSelected(index));
                        item.onTap?.call();
                      },
                      child: SizedBox(
                        width: itemWidth,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 56,
                              width: 56,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.alphaBlend(
                                  theme.colorScheme.primary.withValues(
                                    alpha: isSelected ? 0.8 : 0.3,
                                  ), // tune intensity here
                                  ext.glassBackground,
                                ),
                                border: Border.all(
                                  color: isSelected
                                      ? theme.colorScheme.primary
                                      : ext.glassBorder,
                                  width: 3.0,
                                ),
                              ),
                              child: Icon(
                                item.icon,
                                size: 26,
                                color: theme.colorScheme.onSurface,
                              ),
                            ),
                            const SizedBox(height: 6.0),
                            Text(
                              item.label,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodySmall!.copyWith(
                                color: isSelected
                                    ? theme.colorScheme.primary
                                    : theme.colorScheme.primary
                                        .withValues(alpha: 0.6),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            // reserve space so the label doesn't sit
                            // on top of the sliding indicator
                            const SizedBox(height: 6.0),
                          ],
                        ),
                      ),
                    );
                  }),
                ),

                // Sliding selection indicator
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOutCubic,
                  left: (selectedIndex * itemWidth) +
                      ((itemWidth - indicatorWidth) / 2),
                  bottom: 0,
                  width: indicatorWidth,
                  height: indicatorHeight,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius:
                          BorderRadius.circular(indicatorHeight / 2),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}