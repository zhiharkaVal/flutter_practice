import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/filters_provider.dart';

class FiltersView extends ConsumerWidget {
  const FiltersView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Filters:')),
      body: Column(
        children: [
          SwitchListTile(
            title: Text(
              'Gluten-free',
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
            subtitle: Text(
              'Only include gluten-free meals.',
              style: Theme.of(
                context,
              ).textTheme.labelMedium!.copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 35, right: 20),
            value: activeFilters[Filter.glutenFree]!,
            onChanged: (isChecked) {
              ref.read(filtersProvider.notifier).setFilter(Filter.glutenFree, isChecked);
            },
          ),
          SwitchListTile(
            title: Text(
              'Lactose-free',
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
            subtitle: Text(
              'Only include lactose-free meals.',
              style: Theme.of(
                context,
              ).textTheme.labelMedium!.copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 35, right: 20),
            value: activeFilters[Filter.lactoseFree]!,
            onChanged: (isChecked) {
              ref.read(filtersProvider.notifier).setFilter(Filter.lactoseFree, isChecked);
            },
          ),
          SwitchListTile(
            title: Text(
              'Vegetarian',
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
            subtitle: Text(
              'Only include vegetarian meals.',
              style: Theme.of(
                context,
              ).textTheme.labelMedium!.copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 35, right: 20),
            value: activeFilters[Filter.vegetarian]!,
            onChanged: (isChecked) {
              ref.read(filtersProvider.notifier).setFilter(Filter.vegetarian, isChecked);
            },
          ),
        ],
      ),
    );
  }
}
