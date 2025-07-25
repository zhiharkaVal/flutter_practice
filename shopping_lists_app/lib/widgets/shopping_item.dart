import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/shopping_list_provider.dart';
import '../models/grocery_item.dart';

class ShoppingItem extends ConsumerWidget {
  final GroceryItem item;
  const ShoppingItem({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String message = "";

    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) async {
        ScaffoldMessenger.of(context).clearSnackBars();
        Future<void> itemDeletion = ref
            .read(shoppingListProvider.notifier)
            .removeShoppingItem(item);
        await itemDeletion
            .then((ctx) {
              message = "${item.name} was successfully deleted";
            })
            .catchError((error) {
              message = "Item could not be deleted.";
            });
        ref.invalidate(shoppingListProvider);
        // Context should not be used here for some reason, should showSnackBar
        // moved elsewhere?
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              message,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
            duration: const Duration(seconds: 5),
          ),
        );
      },
      child: ListTile(
        leading: Container(width: 25, height: 25, color: item.category.color),
        title: Text(item.name),
        trailing: Text(item.quantity.toString()),
      ),
    );
  }
}
