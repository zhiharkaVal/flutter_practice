import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/grocery_item.dart';

class ShoppingListNotifier extends StateNotifier<List<GroceryItem>> {
  ShoppingListNotifier() : super([]);

  void addShoppingItem(GroceryItem item) {
    state = [...state, item];
  }

  void removeShoppingItem(GroceryItem itemToDelete) {
    final updatedState = state.where((item) => item != itemToDelete).toList();
    state = [...updatedState];
  }
}

final shoppingListProvider =
    StateNotifierProvider<ShoppingListNotifier, List<GroceryItem>>(
      (reference) => ShoppingListNotifier(),
    );
