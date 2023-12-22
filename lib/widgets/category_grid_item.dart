import 'package:eatables/models/category.dart';
import 'package:flutter/material.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            category.color.withOpacity(0.5),
            category.color.withOpacity(0.9),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Text(
        category.title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      padding: const EdgeInsets.all(16),
    );
  }
}
