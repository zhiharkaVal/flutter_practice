import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../data/database_connectors.dart';
import '../models/grocery_item.dart';

class ShoppingListNotifier extends AutoDisposeAsyncNotifier<List<GroceryItem>> {
  @override
  Future<List<GroceryItem>> build() async {
    return getShoppingList();
  }

  Future<void> addShoppingItem(GroceryItem item) async {
    await http.post(
      Uri.https(dbUrl, '$shoppingListEndPoint.json'),
      headers: {'Content-Type': "application/json"},
      body: item.toJson(),
    );

    ref.invalidateSelf();
    await future;
  }

  Future<void> removeShoppingItem(GroceryItem itemToDelete) async {
    final response = await http.delete(
      Uri.https(dbUrl, '{$shoppingListEndPoint}/${itemToDelete.id}.json'),
    );

    // Note that deleting non-existing item or calling non-existing end-point
    // will still return 200 in case of Firebase
    if (response.statusCode != 200) {
      throw Exception("Item deletion failed");
    }
    await future;
  }

  Future<List<GroceryItem>> getShoppingList() async {
    final response = await http.get(
      Uri.https(dbUrl, '$shoppingListEndPoint.json'),
    );
    if (response.body == "null") {
      return [];
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final shoppingList = json.entries
        .map((item) => GroceryItem.fromJson(item.key, item.value))
        .toList();
    return shoppingList;
  }
}

final shoppingListProvider =
    AsyncNotifierProvider.autoDispose<ShoppingListNotifier, List<GroceryItem>>(
      ShoppingListNotifier.new,
    );
