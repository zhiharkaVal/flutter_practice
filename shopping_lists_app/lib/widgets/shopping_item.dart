import 'package:flutter/material.dart';
import '../models/grocery_item.dart';

class ShoppingItem extends StatelessWidget {
  final GroceryItem item;
  const ShoppingItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(width: 25, height: 25, color: item.category.color),
      title: Text(item.name),
      trailing: Text(item.quantity.toString()),
    );
  }
}
