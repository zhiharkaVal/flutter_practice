import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  final void Function(String identifier) onSelectView;
  const SideDrawer({super.key, required this.onSelectView});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.8),
                ],
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.fastfood_rounded, size: 48, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 20),
                Text(
                  'Cooking Up!',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              onSelectView('meals');
            },
            leading: Icon(Icons.restaurant, size: 25, color: Theme.of(context).colorScheme.onPrimaryContainer),
            title: Text(
              'Meals',
              style: Theme.of(
                context,
              ).textTheme.titleSmall!.copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer, fontSize: 24),
            ),
          ),
          ListTile(
            onTap: () {
              onSelectView('filters');
            },
            leading: Icon(Icons.settings, size: 25, color: Theme.of(context).colorScheme.onPrimaryContainer),
            title: Text(
              'Filters',
              style: Theme.of(
                context,
              ).textTheme.titleSmall!.copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer, fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
