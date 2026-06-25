import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pawpatrol/core/bloc/bottom%20nav%20bar/bottom_nav_bloc.dart';
import 'package:pawpatrol/core/bloc/bottom%20nav%20bar/bottom_nav_event.dart';
import 'package:pawpatrol/core/bloc/bottom%20nav%20bar/bottom_nav_state.dart';
import 'package:pawpatrol/routes/app_route_paths.dart';

class MainShell extends StatelessWidget {
  final Widget child;
  const MainShell({super.key, required this.child});

  static const _tabs = [
    AppRoutesPaths.home,
    AppRoutesPaths.orders,
    AppRoutesPaths.wishlist,
    AppRoutesPaths.profile,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BottomNavBloc(),
      child: Scaffold(
        extendBody: true, // lets content go behind the nav bar
        body: child,
        bottomNavigationBar: const _GlassmorphicNavBar(),
      ),
    );
  }
}

class _GlassmorphicNavBar extends StatefulWidget {
  const _GlassmorphicNavBar();

  @override
  State<_GlassmorphicNavBar> createState() => _GlassmorphicNavBarState();
}

class _GlassmorphicNavBarState extends State<_GlassmorphicNavBar> {
  // For swipe detection
  double _dragStartX = 0;
  static const double _swipeThreshold = 50.0;

  static const _tabs = [
    AppRoutesPaths.home,
    AppRoutesPaths.orders,
    AppRoutesPaths.wishlist,
    AppRoutesPaths.profile,
  ];

  static const _labels = ['All', 'Order Again', 'Wishlist', 'Profile'];

  static const _icons = [
    Icons.home_rounded,
    Icons.replay_rounded,
    Icons.favorite_rounded,
    Icons.person_rounded,
  ];

  void _onTabTapped(BuildContext context, int index) {
    context.read<BottomNavBloc>().add(BottomNavTabChanged(index));
    context.go(_tabs[index]);
  }

  void _onDragStart(DragStartDetails details) {
    _dragStartX = details.globalPosition.dx;
  }

  void _onDragEnd(
    BuildContext context,
    DragEndDetails details,
    int currentIndex,
  ) {
    final dx = details.globalPosition.dx - _dragStartX;
    if (dx.abs() < _swipeThreshold) return;

    final newIndex = dx < 0
        ? (currentIndex + 1).clamp(0, _tabs.length - 1) // swipe left → next
        : (currentIndex - 1).clamp(0, _tabs.length - 1); // swipe right → prev

    if (newIndex != currentIndex) _onTabTapped(context, newIndex);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        return GestureDetector(
          onHorizontalDragStart: _onDragStart,
          onHorizontalDragEnd: (details) =>
              _onDragEnd(context, details, state.selectedIndex),
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, bottomPadding + 12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  height: 64,
                  decoration: BoxDecoration(
                    color: theme.primaryColor.withValues(alpha: 0.25),
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(
                      color: theme.colorScheme.onSurface.withValues(
                        alpha: 0.15,
                      ),
                    ),
                  ),
                  child: Row(
                    children: List.generate(_labels.length, (index) {
                      final isSelected = state.selectedIndex == index;
                      return Expanded(
                        child: GestureDetector(
                          onTap: () => _onTabTapped(context, index),
                          behavior: HitTestBehavior.opaque,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 4,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? theme.colorScheme.onSurface.withValues(
                                      alpha: 0.15,
                                    )
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  _icons[index],
                                  size: 20,
                                  color: isSelected
                                      ? theme.colorScheme.onSurface
                                      : theme.colorScheme.onSurface.withValues(
                                          alpha: 0.5,
                                        ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  _labels[index],
                                  style: theme.textTheme.labelSmall!.copyWith(
                                    color: isSelected
                                        ? theme.colorScheme.onSurface
                                        : theme.colorScheme.onSurface
                                              .withValues(alpha: 0.5),
                                    fontWeight: isSelected
                                        ? FontWeight.w700
                                        : FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
