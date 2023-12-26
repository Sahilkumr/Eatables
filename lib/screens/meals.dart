import 'package:eatables/models/meal.dart';
import 'package:eatables/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key, this.title, required this.favMeals, required this.meals,required this.onToggleFavourite});

  final String? title;
  final List<Meal> meals; // using the meals model to get the data.
  final void Function(Meal meal) onToggleFavourite;
  final List<Meal> favMeals;

  @override
  Widget build(BuildContext context) {
    Widget bodyContent = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(meal: meals[index],onToggleFavourite: onToggleFavourite,favMeals: favMeals,));

    if (meals.isEmpty) {
      bodyContent = Center(
        child: Text(
          'no meals Available',
          style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
        ),
      );
    }

    if (title == null) {
      return bodyContent;
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          title!,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ),
      body: bodyContent,
    );
  }
}
