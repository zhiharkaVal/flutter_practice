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
  @override
  void initState() {
    super.initState();

    ref.listenManual(shoppingListProvider, (previous, next) {
      // TODO show a snackbar/dialog
    });
  }

  void _addShoppingItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(builder: (ctx) => const NewShoppingItemView()),
    );
    if (newItem == null) {
      return;
    }
    ref.read(shoppingListProvider.notifier).addShoppingItem(newItem);
  }

  Widget _emptyShoppingListContent(String message, bool isLoading) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          isLoading
              ? const CircularProgressIndicator()
              : Text(
                  message,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
        ],
      ),
    );
  }

  Widget _shoppingListContent(List<GroceryItem>? shoppingList) {
    if (shoppingList != null && shoppingList.isNotEmpty) {
      return ListView.builder(
        itemCount: shoppingList.length,
        itemBuilder: (ctx, index) => ShoppingItem(item: shoppingList[index]),
      );
    } else {
      return _emptyShoppingListContent('Your shopping list is empty.', false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<GroceryItem>> shoppingList = ref.watch(
      shoppingListProvider,
    );

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: _addShoppingItem, icon: const Icon(Icons.add)),
        ],
        title: const Text("Shopping list"),
      ),
      body: switch (shoppingList) {
        AsyncData(:final value) => _shoppingListContent(value),
        AsyncError() => _emptyShoppingListContent(
          'Oops, something went wrong...',
          false,
        ),
        AsyncLoading() => _emptyShoppingListContent('Fetching data...', true),
        _ => const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [CircularProgressIndicator()],
          ),
        ),
      },
    );
  }
}
