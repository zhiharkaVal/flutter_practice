import 'package:flutter/material.dart';
import 'package:recipes_app/data/seed_data.dart';
import 'package:recipes_app/screens/meals.dart';
import 'package:recipes_app/widgets/category_grid_item.dart';
import '../models/category.dart';
import '../models/meal.dart';

class CategoriesView extends StatelessWidget {
  final void Function(Meal meal) onToggleFavourite;
  const CategoriesView({super.key, required this.onToggleFavourite});

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();
    // Add a new "screen" on top of the previous screen creating a screen stack.
    // Hence, push and pop
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsView(title: category.title, meals: filteredMeals, onToggleFavourite: onToggleFavourite),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(category: category, onCategorySelected: () => _selectCategory(context, category)),
      ],
    );
  }
}
