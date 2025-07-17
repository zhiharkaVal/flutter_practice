import 'package:flutter/material.dart';
import 'package:recipes_app/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  final Category category;
  const CategoryGridItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            category.color.withValues(alpha: 0.55),
            category.color.withValues(alpha: 0.9)
          ]
        )
      ),
      child: Text(
        category.title,
        style: Theme.of(context).textTheme.titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onPrimary
        )
      ),
    );
  }
}