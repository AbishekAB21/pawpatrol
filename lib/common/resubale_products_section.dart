import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pawpatrol/common/reusable_product_card.dart';
import 'package:pawpatrol/core/bloc/home%20screen/home_bloc.dart';
import 'package:pawpatrol/core/bloc/home%20screen/home_event.dart';
import 'package:pawpatrol/core/bloc/home%20screen/home_state.dart';

class ResubaleProductsSection extends StatelessWidget {
  const ResubaleProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Handpicked for happy tails",
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w800,
            color: theme.colorScheme.primary,
          ),
        ),

        const SizedBox(height: 12),

        SizedBox(
          height: 200,
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: state.products.length,
                separatorBuilder: (_, __) =>
                    const SizedBox(width: 12),

                itemBuilder: (context, index) {
                  final product = state.products[index];

                  return ProductCard(
                    product: product,

                    onAdd: () {
                      context.read<HomeBloc>().add(
                        AddProduct(product.id),
                      );
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
      ],
    );
  }
}