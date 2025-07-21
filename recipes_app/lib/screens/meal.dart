import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_app/providers/favourites_provider.dart';

import '../models/meal.dart';

class MealDetailsView extends ConsumerWidget {
  final Meal meal;
  const MealDetailsView({super.key, required this.meal});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouriteMeals = ref.watch(favouriteMealsProvider);
    final isFavourite = favouriteMeals.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final isNowFavourite = ref.read(favouriteMealsProvider.notifier).toggleMealStatus(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    isNowFavourite
                        ? '"{$meal.title}" was added to favourites'
                        : '"${meal.title}" was removed from favourites',
                  ),
                  duration: const Duration(seconds: 5),
                ),
              );
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 450),
              transitionBuilder: (child, animation) {
                return RotationTransition(turns: Tween<double>(begin: 0.85, end: 1).animate(animation), child: child);
              },
              child: Icon(isFavourite ? Icons.star : Icons.star_border_rounded, key: ValueKey(isFavourite)),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal.id,
              child: Image.network(meal.imageUrl, height: 300, width: double.infinity, fit: BoxFit.cover),
            ),
            const SizedBox(height: 15),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer),
              ),
            const SizedBox(height: 15),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            for (final step in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
