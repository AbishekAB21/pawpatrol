import 'dart:ui';

import 'package:flutter/material.dart';

class PinnedHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  PinnedHeaderDelegate({
    required this.child,
    required this.height,
  });

  @override
  double get minExtent => height;

  @override
  double get maxExtent => height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final theme = Theme.of(context);

    return SizedBox(
      height: height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (overlapsContent)
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 35,
                  sigmaY: 35,
                ),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),

          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: overlapsContent
                  ? theme.primaryColor.withValues(alpha: 0.28)
                  : Colors.transparent,
              border: overlapsContent
                  ? Border(
                      bottom: BorderSide(
                        color: Colors.white.withValues(alpha: 0.15),
                      ),
                    )
                  : null,
            ),
          ),

          child,
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(
    covariant PinnedHeaderDelegate oldDelegate,
  ) {
    return true;
  }
}