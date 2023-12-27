import 'package:eatables/providers/filters_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({super.key});

  @override
  ConsumerState<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  var _isGlutenFree = false;
  var _isLactoseFree = false;

  @override
  void initState() {
    super.initState();
    final activeFilters = ref.read(filterProvider);
    _isGlutenFree = activeFilters[Filter.glutenFree]!;
    _isLactoseFree = activeFilters[Filter.lactoseFree]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: _isGlutenFree,
            onChanged: (isChecked) {
              setState(() {
                _isGlutenFree = isChecked;
              });
            },
            title: Text(
              'Gluten-Free',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'only Gluten Free Meals',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Colors.yellow,
          ),
          SwitchListTile(
            value: _isLactoseFree,
            onChanged: (isChecked) {
              setState(() {
                _isLactoseFree = isChecked;
              });
            },
            title: Text(
              'Lactose-Free',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'only Lactose Free Meals',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
