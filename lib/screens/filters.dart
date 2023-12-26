import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _isFilterApplied = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: true,
            onChanged: (isChecked){
              _isFilterApplied = isChecked;
            },
            title: Text('Gluten-Free',style: Theme.of(context).textTheme.titleMedium,),
            subtitle: Text('only Gluten Free Meals',style: Theme.of(context).textTheme.titleSmall,),
            activeColor:
          ),
        ],
      ),
    );
  }
}
