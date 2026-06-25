import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pawpatrol/common/reusable_product_card.dart';
import 'package:pawpatrol/core/bloc/home%20screen/home_bloc.dart';
import 'package:pawpatrol/core/bloc/home%20screen/home_event.dart';
import 'package:pawpatrol/core/bloc/home%20screen/home_state.dart';
import 'package:pawpatrol/utils/theme/app_theme_extension.dart';

class SaleSection extends StatefulWidget {
  const SaleSection({super.key});

  @override
  State<SaleSection> createState() => _SaleSectionState();
}

class _SaleSectionState extends State<SaleSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppThemeExtension>()!;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _PulsingGlowBorderPainter(
            progress: _controller.value,
            borderRadius: 20.0,
            borderWidth: 2.0,
            glowColor: theme.colorScheme.primary,
            baseColor: theme.colorScheme.onSurface,
          ),
          child: child,
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          color: Color.alphaBlend(
            ext.glassBackground.withValues(alpha: 0.8),
            theme.colorScheme.primary.withValues(alpha: 0.8),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset("assets/images/sale_image.png", width: 100),
                const SizedBox(width: 1.0),
                Text(
                  "BIG WOOF SALE!",
                  style: theme.textTheme.headlineLarge!.copyWith(
                    color: Color.alphaBlend(
                      ext.glassBackground,
                      theme.colorScheme.primary,
                    ),
                    fontSize: 30.0,
                  ),
                ),
              ],
            ),
            Divider(
              color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.2),
            ),
            Text(
              "Flat 50% off on the below products!",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w600,
                color: Color.alphaBlend(
                  ext.glassBackground,
                  Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              height: 200,
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.products.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      final product = state.products[index];
                      return ProductCard(
                        product: product,
                        onAdd: () {
                          context.read<HomeBloc>().add(AddProduct(product.id));
                        },
                        onIncrement: () {
                          context
                              .read<HomeBloc>()
                              .add(IncrementProduct(product.id));
                        },
                        onDecrement: () {
                          context
                              .read<HomeBloc>()
                              .add(DecrementProduct(product.id));
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PulsingGlowBorderPainter extends CustomPainter {
  final double progress;
  final double borderRadius;
  final double borderWidth;
  final Color glowColor;
  final Color baseColor;

  const _PulsingGlowBorderPainter({
    required this.progress,
    required this.borderRadius,
    required this.borderWidth,
    required this.glowColor,
    required this.baseColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(
      borderWidth / 2,
      borderWidth / 2,
      size.width - borderWidth,
      size.height - borderWidth,
    );

    final rrect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(borderRadius),
    );

    final borderPath = Path()..addRRect(rrect);

    // Pulse value oscillates between 0 and 1
    final pulse = (math.sin(progress * 2 * math.pi) + 1) / 2;

    // Outermost diffused glow — wide and soft
    final outerGlowPaint = Paint()
      ..color = glowColor.withValues(alpha: 0.15 + 0.15 * pulse)
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth + 18
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 14);

    // Mid glow layer — tighter and brighter
    final midGlowPaint = Paint()
      ..color = glowColor.withValues(alpha: 0.35 + 0.2 * pulse)
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth + 8
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);

    // Core border — crisp, full opacity
    final corePaint = Paint()
      ..color = glowColor.withValues(alpha: 0.8 + 0.2 * pulse)
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    canvas.drawPath(borderPath, outerGlowPaint);
    canvas.drawPath(borderPath, midGlowPaint);
    canvas.drawPath(borderPath, corePaint);
  }

  @override
  bool shouldRepaint(covariant _PulsingGlowBorderPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.glowColor != glowColor;
  }
}