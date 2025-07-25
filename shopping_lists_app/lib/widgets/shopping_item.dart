import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/shopping_list_provider.dart';
import '../models/grocery_item.dart';

class ShoppingItem extends ConsumerWidget {
  final GroceryItem item;
  const ShoppingItem({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: ValueKey(item.id),
      onDismissed: (direction) {
        ref.read(shoppingListProvider.notifier).removeShoppingItem(item);
      },
      child: ListTile(
        leading: Container(width: 25, height: 25, color: item.category.color),
        title: Text(item.name),
        trailing: Text(item.quantity.toString()),
      ),
    );
  }
}
