class PetSubCategory {
  final String id;
  final String name;
  final String imageAsset; // e.g. "assets/images/cat_food.png"

  const PetSubCategory({
    required this.id,
    required this.name,
    required this.imageAsset,
  });
}

class PetCategory {
  final String id;
  final String title;        // "Meow Stuff" / "Bow-Wow Stuff"
  final String emoji;        // "🐱" / "🐶"
  final List<PetSubCategory> subCategories;

  const PetCategory({
    required this.id,
    required this.title,
    required this.emoji,
    required this.subCategories,
  });
}