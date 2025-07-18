import 'package:flutter/material.dart';
import 'package:recipes_app/screens/categories.dart';
import 'package:recipes_app/screens/meals.dart';

class TabsView extends StatefulWidget {
  const TabsView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabsViewState();
  }
}

class _TabsViewState extends State<TabsView> {
  int _selectedViewIndex = 0;

  void _selectView(int index) {
    setState(() {
      _selectedViewIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeView = const CategoriesView();
    var activePageTitle = 'Categories';
    if (_selectedViewIndex == 1) {
      activeView = MealsView(meals: []);
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
