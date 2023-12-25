import 'package:eatables/data/dummy_data.dart';
import 'package:eatables/models/category.dart';
import 'package:eatables/screens/meals.dart';
import 'package:eatables/widgets/category_grid_item.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectedCategory(BuildContext context, Category category) {
    final filteredMeal = dummyMeals
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealScreen(
          title: category.title,
          meals: filteredMeal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eatables Category'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryItem(
              category: category,
              onCategoryItemSelected: () => _selectedCategory(context, category),
            )
        ],
      ),
    );
  }
}
