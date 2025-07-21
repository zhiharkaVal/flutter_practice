import 'package:flutter/material.dart';
import 'package:recipes_app/data/seed_data.dart';
import 'package:recipes_app/screens/meals.dart';
import 'package:recipes_app/widgets/category_grid_item.dart';
import '../models/category.dart';
import '../models/meal.dart';

class CategoriesView extends StatefulWidget {
  final List<Meal> availableMeals;
  const CategoriesView({super.key, required this.availableMeals});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> with SingleTickerProviderStateMixin {
  // The param will be initialised at some point later, but at latest when
  // it will be used for the first time.
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      // Default values
      // lowerBound: 0,
      // upperBound: 1,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeals.where((meal) => meal.categories.contains(category.id)).toList();
    // Adds a new "screen" on top of the previous screen creating a screen stack.
    // Hence, push and pop
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsView(title: category.title, meals: filteredMeals),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
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
      ),
      builder:  (context, child) => SlideTransition(
          position: Tween(
              begin: const Offset(0, 0.3), // animation starts 30% below action position
              end: const Offset(0, 0),
            ).animate(
              CurvedAnimation(
                parent: _animationController,
                curve: Curves.easeInOut
              )
          ),
          child: child
      ),
    );
  }
}
