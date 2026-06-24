import 'package:flutter/material.dart';
import 'package:pawpatrol/features/home%20screen/widgets/category_tab.dart';


class CategoryTabsData {
  
 static List<CategoryTabItem> items(BuildContext context) {
  return [
    CategoryTabItem(
      icon: Icons.shopping_bag_rounded,
      label: 'All',
      onTap: () {
        // Navigate to food category
      },
    ),
    CategoryTabItem(
      icon: Icons.pets_rounded,
      label: 'Food',
      onTap: () {
        // Navigate to food category
      },
    ),
    CategoryTabItem(
      icon: Icons.toys_rounded,
      label: 'Toys',
      onTap: () {
        // Navigate to toys category
      },
    ),
    CategoryTabItem(
      icon: Icons.content_cut_rounded,
      label: 'Grooming',
      onTap: () {
        // Navigate to grooming category
      },
    ),
    CategoryTabItem(
      icon: Icons.medical_services_rounded,
      label: 'Vet Care',
      onTap: () {
        // Navigate to vet care category
      },
    ),
    CategoryTabItem(
      icon: Icons.checkroom_rounded,
      label: 'Accessories',
      onTap: () {
        // Navigate to accessories category
      },
    ),
  ];
}

}