// Redux can be used as an alternative to Riverpod
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_app/providers/meals_provider.dart';

enum Filter { glutenFree, lactoseFree, vegetarian }

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier() : super({Filter.glutenFree: false, Filter.lactoseFree: false, Filter.vegetarian: false});

  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }

  void setFilters(Map<Filter, bool> updatedFilters) {
    state = updatedFilters;
  }
}

final filtersProvider = StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>((reference) => FiltersNotifier());

final filteredMealsProvider = Provider((reference) {
  final meals = reference.watch(mealsProvider);
  final activeFilters = reference.watch(filtersProvider);

  return meals.where((meal) {
    if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    return true;
  }).toList();
});
