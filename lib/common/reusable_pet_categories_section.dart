import 'package:flutter/material.dart';
import 'package:pawpatrol/features/home%20screen/core/data/pet_sub_category_data.dart';
import 'package:pawpatrol/features/home%20screen/core/models/pet_sub_category_model.dart';

class ReusablePetCategoriesSection extends StatelessWidget {
  const ReusablePetCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: PetCategoryData.categories
          .map((category) => _PetCategoryBlock(category: category))
          .toList(),
    );
  }
}

class _PetCategoryBlock extends StatelessWidget {
  final PetCategory category;

  const _PetCategoryBlock({required this.category});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 14.0),
          child: Text(
            category.title,
            style: theme.textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.w800,
              color: theme.colorScheme.primary,
            ),
          ),
        ),

        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 12,
            crossAxisSpacing: 10,
            // Fixed total cell height: 120px card + 6px gap + ~30px label
            mainAxisExtent: 156,
          ),
          itemCount: category.subCategories.length,
          itemBuilder: (context, index) {
            return _SubCategoryCard(sub: category.subCategories[index]);
          },
        ),
      ],
    );
  }
}

class _SubCategoryCard extends StatelessWidget {
  final PetSubCategory sub;

  const _SubCategoryCard({required this.sub});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        // TODO: navigate to product listing filtered by sub.id
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Fixed height container — every card is exactly the same size
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: theme.colorScheme.onSurface,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.surface.withValues(alpha: 0.08),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              sub.imageAsset,
              fit: BoxFit.contain,
              alignment: Alignment.center,
              errorBuilder: (_, __, ___) => Center(
                child: Icon(
                  Icons.pets,
                  size: 36,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
          ),

          const SizedBox(height: 6),
          Text(
            sub.name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.w700,
              color: theme.colorScheme.surface,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}