import 'package:flutter/material.dart';
import 'package:recipes_app/screens/categories.dart';
import 'package:recipes_app/screens/filters.dart';
import 'package:recipes_app/screens/meals.dart';

import '../data/seed_data.dart';
import '../models/meal.dart';
import '../widgets/side_drawer.dart';

const _kInitialfilters = {Filter.glutenFree: false, Filter.lactoseFree: false, Filter.vegetarian: false};

class TabsView extends StatefulWidget {
  const TabsView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabsViewState();
  }
}

class _TabsViewState extends State<TabsView> {
  final List<Meal> _favourites = [];
  int _selectedViewIndex = 0;
  Map<Filter, bool> _filters = _kInitialfilters;

  void _selectView(int index) {
    setState(() {
      _selectedViewIndex = index;
    });
  }

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message), duration: const Duration(seconds: 5)));
  }

  void _setView(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final result = await Navigator.of(
        context,
      ).push<Map<Filter, bool>>(MaterialPageRoute(builder: (ctx) => FiltersView(currentFilters: _filters)));

      setState(() {
        _filters = result ?? _kInitialfilters;
      });
    }
  }

  void _toggleMealFavouriteStatus(Meal meal) {
    final isFavourite = _favourites.contains(meal);

    if (isFavourite) {
      setState(() {
        _favourites.remove(meal);
        _showInfoMessage('"${meal.title}" was removed from favourites');
      });
    } else {
      setState(() {
        _favourites.add(meal);
        _showInfoMessage('"${meal.title}" is marked as favourite');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (_filters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_filters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_filters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
    Widget activeView = CategoriesView(availableMeals: availableMeals, onToggleFavourite: _toggleMealFavouriteStatus);
    var activePageTitle = 'Categories';
    if (_selectedViewIndex == 1) {
      activeView = MealsView(meals: _favourites, onToggleFavourite: _toggleMealFavouriteStatus);
      activePageTitle = 'Your Favourites';
    }

    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      drawer: SideDrawer(onSelectView: _setView),
      body: activeView,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedViewIndex,
        onTap: (index) {
          _selectView(index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Meal Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),
        ],
      ),
    );
  }
}
