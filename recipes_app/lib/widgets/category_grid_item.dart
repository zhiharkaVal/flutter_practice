import 'package:flutter/material.dart';
import 'package:recipes_app/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  final Category category;
  final void Function() onCategorySelected;
  const CategoryGridItem({super.key, required this.category, required this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    // InkWell and GestureDetector add listeners to user actions
    return InkWell(
      onTap: onCategorySelected,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [category.color.withValues(alpha: 0.55), category.color.withValues(alpha: 0.9)],
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
    );
  }
}
