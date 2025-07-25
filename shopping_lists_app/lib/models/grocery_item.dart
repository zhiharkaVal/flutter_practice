import 'dart:convert';
import 'package:shopping_lists_app/models/category.dart';

class GroceryItem {
  final String id;
  final String name;
  final int quantity;
  final Category category;

  const GroceryItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.category,
  });

  factory GroceryItem.fromJson(String id, Map<String, dynamic> jsonItem) {
    final categoryColor = json.decode(jsonItem['category-color']);
    return GroceryItem(
      id: id,
      name: jsonItem['name'] as String,
      quantity: jsonItem['quantity'] as int,
      category: Category.fromJson(jsonItem['category'], categoryColor),
    );
  }

  String toJson() {
    return json.encode({
      'name': name,
      'quantity': quantity,
      'category': category.title,
      'category-color': category.colorToJson(),
    });
  }
}
