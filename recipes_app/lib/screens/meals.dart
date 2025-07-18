import 'package:flutter/material.dart';
import 'package:recipes_app/models/meal.dart';

import '../widgets/meal_item.dart';
import 'meal.dart';

class MealsView extends StatelessWidget {
  final String title;
  final List<Meal> meals;
  const MealsView({super.key, required this.title, required this.meals});

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => MealDetailsView(meal: meal)));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'No meals available yet',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Theme.of(context).colorScheme.onPrimary),
          ),
          const SizedBox(height: 25),
          Text(
            'Try selecting a different category',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) =>
            MealItem(meal: meals[index], onMealItemSelected: (meal) => selectMeal(context, meal)),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: content,
    );
  }
}
