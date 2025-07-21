import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';

class FavouriteMealsNotifier extends StateNotifier<List<Meal>> {
  // Instantiates initial data, which should not be modified, but replaced
  FavouriteMealsNotifier() : super([]);

  bool toggleMealStatus(Meal meal) {
    final mealIsFavourite = state.contains(meal);
    if (mealIsFavourite) {
      state = state.where((recipe) => recipe.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favouriteMealsProvider = StateNotifierProvider<FavouriteMealsNotifier, List<Meal>>((reference) {
  return FavouriteMealsNotifier();
});
