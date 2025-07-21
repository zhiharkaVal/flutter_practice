import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/shopping_list_provider.dart';
import '../widgets/shopping_item.dart';

class ShoppingListView extends ConsumerWidget {
  const ShoppingListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shoppingList = ref.watch(shoppingListProvider);

    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Your shopping list is empty',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );

    if (shoppingList.isNotEmpty) {
      content = ListView.builder(
        itemCount: shoppingList.length,
        itemBuilder: (ctx, index) => ShoppingItem(item: shoppingList[index]),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Shopping list")),
      body: content,
    );
  }
}
