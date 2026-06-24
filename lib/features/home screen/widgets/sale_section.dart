import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pawpatrol/common/reusable_product_card.dart';
import 'package:pawpatrol/core/bloc/home%20screen/home_bloc.dart';
import 'package:pawpatrol/core/bloc/home%20screen/home_event.dart';
import 'package:pawpatrol/core/bloc/home%20screen/home_state.dart';
import 'package:pawpatrol/utils/theme/app_theme_extension.dart';

class SaleSection extends StatelessWidget {
  const SaleSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppThemeExtension>()!;
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10.0),

      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.onSurface, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
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

              SizedBox(width: 1.0),

              Text(
                "BIG WOOF SALE!",
                style: theme.textTheme.headlineLarge!.copyWith(
                  color: Color.alphaBlend(
                    ext.glassBackground,
                    theme.colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),

          Divider(color: theme.colorScheme.surface.withValues(alpha: 0.2)),

          Text(
            "Flat 50% off on the below products!",
            style: theme.textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w600,
              color: Color.alphaBlend(
                ext.glassBackground,
                theme.colorScheme.primary,
              ),
            ),
          ),

          SizedBox(height: 10.0),

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
                        context.read<HomeBloc>().add(
                          IncrementProduct(product.id),
                        );
                      },

                      onDecrement: () {
                        context.read<HomeBloc>().add(
                          DecrementProduct(product.id),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),

          // Products on sale
        ],
      ),
    );
  }
}
