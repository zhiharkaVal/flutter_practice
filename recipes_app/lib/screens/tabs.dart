import 'package:flutter/material.dart';
import 'package:recipes_app/screens/categories.dart';
import 'package:recipes_app/screens/meals.dart';

import '../models/meal.dart';

class TabsView extends StatefulWidget {
  const TabsView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabsViewState();
  }
}

class _TabsViewState extends State<TabsView> {
  int _selectedViewIndex = 0;
  final List<Meal> _favourites = [];

  void _selectView(int index) {
    setState(() {
      _selectedViewIndex = index;
    });
  }

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message), duration: const Duration(seconds: 5)));
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
    Widget activeView = CategoriesView(onToggleFavourite: _toggleMealFavouriteStatus);
    var activePageTitle = 'Categories';
    if (_selectedViewIndex == 1) {
      activeView = MealsView(meals: _favourites, onToggleFavourite: _toggleMealFavouriteStatus);
      activePageTitle = 'Your Favourites';
    }

    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
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
