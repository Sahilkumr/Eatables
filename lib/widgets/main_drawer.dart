import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectDrawerOption});

  final void Function(String screen) onSelectDrawerOption;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(.7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.cookie,
                  size: 48,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Eatables',
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant_outlined,
              size: 28,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              'Meals',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            onTap: () {onSelectDrawerOption('Meals');},
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 28,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              'Filters',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            onTap: () {onSelectDrawerOption('Filters');},
          ),
        ],
      ),
    );
  }
}
