import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_lists_app/views/new_shopping_item.dart';
import '../models/grocery_item.dart';
import '../providers/shopping_list_provider.dart';
import '../widgets/shopping_item.dart';

class ShoppingListView extends ConsumerStatefulWidget {
  const ShoppingListView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ShoppingListViewState();
  }
}

class _ShoppingListViewState extends ConsumerState<ShoppingListView> {
  void _addShoppingItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(builder: (ctx) => const NewShoppingItemView()),
    );
    if (newItem == null) {
      return;
    }
    ref.read(shoppingListProvider.notifier).addShoppingItem(newItem);
  }

  @override
  Widget build(BuildContext context) {
    final shoppingList = ref.watch(shoppingListProvider);

    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Your shopping list is empty',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
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
      appBar: AppBar(
        actions: [
          IconButton(onPressed: _addShoppingItem, icon: const Icon(Icons.add)),
        ],
        title: const Text("Shopping list"),
      ),
      body: content,
    );
  }
}
