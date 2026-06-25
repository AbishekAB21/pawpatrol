import 'package:pawpatrol/features/home%20screen/core/models/pet_sub_category_model.dart';

class PetCategoryData {
  static const List<PetCategory> categories = [
    PetCategory(
      id: 'cat',
      title: 'Meow Stuff',
      emoji: '🐱',
      subCategories: [
        PetSubCategory(
          id: 'cat_food',
          name: 'Premium Food',
          imageAsset: 'assets/images/dummy_w.jpg',
        ),
        PetSubCategory(
          id: 'cat_treats',
          name: 'Treats',
          imageAsset: 'assets/images/dummy_cat_treats.png',
        ),
        PetSubCategory(
          id: 'cat_supplements',
          name: 'Supplements',
          imageAsset: 'assets/images/dummy_calcium.jpg',
        ),
        PetSubCategory(
          id: 'cat_accessories',
          name: 'Accessories',
          imageAsset: 'assets/images/dummy_cat_thing.jpg',
        ),
      ],
    ),
    PetCategory(
      id: 'dog',
      title: 'Bow-Wow Stuff',
      emoji: '🐶',
      subCategories: [
        PetSubCategory(
          id: 'dog_food',
          name: 'Premium Food',
          imageAsset: 'assets/images/dummy_focus.jpg',
        ),
        PetSubCategory(
          id: 'dog_treats',
          name: 'Treats',
          imageAsset: 'assets/images/dummy_dog_treats.png',
        ),
        PetSubCategory(
          id: 'dog_supplements',
          name: 'Supplements',
          imageAsset: 'assets/images/dummy_calcium.jpg',
        ),
        PetSubCategory(
          id: 'dog_accessories',
          name: 'Accessories',
          imageAsset: 'assets/images/dummy_leash.jpg',
        ),
      ],
    ),
  ];
}
