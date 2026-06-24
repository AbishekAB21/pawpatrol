import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pawpatrol/common/resubale_products_section.dart';
import 'package:pawpatrol/common/resusable_search_box.dart';
import 'package:pawpatrol/features/home%20screen/core/data/category_tab_data.dart';
import 'package:pawpatrol/features/home%20screen/widgets/category_tab.dart';
import 'package:pawpatrol/features/home%20screen/widgets/home_header_section.dart';
import 'package:pawpatrol/features/home%20screen/widgets/sale_section.dart';

class HomeScreenComponent extends StatefulWidget {
  const HomeScreenComponent({super.key});

  @override
  State<HomeScreenComponent> createState() => _HomeScreenComponentState();
}

class _HomeScreenComponentState extends State<HomeScreenComponent> {
  // Height of the floating search box + category tabs bar.
  static const double _barHeight = 175.0;

  // Used to measure the actual rendered height of HomeHeaderSection so
  // we know exactly when the floating bar should land at the top and
  // become pinned.
  final GlobalKey _headerKey = GlobalKey();

  final ScrollController _scrollController = ScrollController();

  // Sensible fallback before the first measurement happens.
  double _headerHeight = 238.0;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _measureHeader() {
    final renderBox =
        _headerKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null && renderBox.hasSize) {
      final measuredHeight = renderBox.size.height;
      if (measuredHeight != _headerHeight) {
        setState(() => _headerHeight = measuredHeight);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Re-measure after every build (not just the first one) so any
    // change to HomeHeaderSection's padding/content — including
    // changes picked up via hot reload — is reflected immediately
    // instead of relying on a stale measurement from initState.
    WidgetsBinding.instance.addPostFrameCallback((_) => _measureHeader());

    return Scaffold(
      body: Container(
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
          child: Stack(
            children: [
              // Scrollable content — sits underneath the floating bar
              // so it actually paints there and can be blurred.
              Positioned.fill(
                child: RefreshIndicator(
                  onRefresh: _handleRefresh,
                  color: theme.colorScheme.primary,
                  backgroundColor: theme.colorScheme.surface,
                  child: ListView(
                    controller: _scrollController,
                    // Switched from BouncingScrollPhysics: with
                    // RefreshIndicator we don't want the header
                    // stretching/bouncing on overscroll — the
                    // spinner alone should communicate the pull.
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    children: [
                      KeyedSubtree(
                        key: _headerKey,
                        child: const HomeHeaderSection(opacity: 1),
                      ),

                      // Reserves the space the floating bar occupies
                      // before it becomes pinned, so content doesn't
                      // jump underneath it.
                      const SizedBox(height: _barHeight),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            SizedBox(height: 20.0,),
                            const ResubaleProductsSection(),

                            const SizedBox(height: 20),

                            SaleSection(),

                            const SizedBox(height: 20),

                            const ResubaleProductsSection(),

                            const SizedBox(height: 20),

                            const ResubaleProductsSection(),

                            const SizedBox(height: 120),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Floating search box + category tabs bar. Listens to
              // the scroll controller directly so only this small
              // subtree rebuilds on scroll, not the whole list.
              AnimatedBuilder(
                animation: _scrollController,
                builder: (context, _) {
                  final offset =
                      _scrollController.hasClients ? _scrollController.offset : 0.0;
                  final barTop =
                      (_headerHeight - offset).clamp(0.0, _headerHeight);
                  // 0 while sliding down with the header, ramps to 1
                  // as the bar reaches the top and becomes pinned.
                  final progress =
                      1 - (barTop / _headerHeight).clamp(0.0, 1.0);

                  return Positioned(
                    top: barTop,
                    left: 0,
                    right: 0,
                    height: _barHeight,
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 35 * progress,
                          sigmaY: 35 * progress,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: theme.primaryColor.withValues(
                              alpha: 0.28 * progress,
                            ),
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.white.withValues(
                                  alpha: 0.15 * progress,
                                ),
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ResusableSearchBox(
                                  hintText: 'Search "Royal Canine"',
                                  prefixIcon: Icon(
                                    Icons.search_rounded,
                                    color: theme.colorScheme.surface,
                                  ),
                                  suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "|",
                                        style: theme.textTheme.bodyMedium,
                                      ),
                                      const SizedBox(width: 5),
                                      Icon(
                                        Icons.mic_rounded,
                                        color: theme.colorScheme.surface,
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 12),

                                SizedBox(
                                  height: 90,
                                  child: CategoryTabsSection(
                                    items: CategoryTabsData.items(context),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // TODO: wire this up to whatever data sources back the home screen
  // (product lists, sale section, etc.) once those are fetched from
  // an API/repository rather than being static widgets.
  Future<void> _handleRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
  }
}