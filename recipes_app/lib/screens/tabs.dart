import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_app/providers/favourites_provider.dart';
import 'package:recipes_app/screens/categories.dart';
import 'package:recipes_app/screens/filters.dart';
import 'package:recipes_app/screens/meals.dart';
import '../providers/filters_provider.dart';
import '../widgets/side_drawer.dart';

class TabsView extends ConsumerStatefulWidget {
  const TabsView({super.key});

  @override
  ConsumerState<TabsView> createState() {
    return _TabsViewState();
  }
}

class _TabsViewState extends ConsumerState<TabsView> {
  int _selectedViewIndex = 0;

  void _selectView(int index) {
    setState(() {
      _selectedViewIndex = index;
    });
  }

  void _setView(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final result = await Navigator.of(
        context,
      ).push<Map<Filter, bool>>(MaterialPageRoute(builder: (ctx) => const FiltersView()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealsProvider);
    Widget activeView = CategoriesView(availableMeals: availableMeals);
    var activePageTitle = 'Categories';
    if (_selectedViewIndex == 1) {
      final favouriteMeals = ref.watch(favouriteMealsProvider);
      activeView = MealsView(meals: favouriteMeals);
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
