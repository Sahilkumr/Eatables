import 'package:eatables/models/meal.dart';
import 'package:eatables/screens/meal_detail.dart';
import 'package:eatables/widgets/meal_item_meta.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
    required this.onToggleFavourite,
    required this.favMeals,
  });

  final void Function(Meal meal) onToggleFavourite;
  final List<Meal> favMeals;

  void _mealDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) =>
            MealDetailScreen(meal: meal ,onToggleFavourite: onToggleFavourite,favMeals: favMeals),
      ),
    );
  }

  final Meal meal;

  get mealComplexity {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  get mealAffordibility {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          _mealDetails(context);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              height: 250,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                color: Colors.black54,
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ), // like text...
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemMetaData(
                            icon: Icons.schedule,
                            label: '${meal.duration} Mins'),
                        const SizedBox(
                          width: 10,
                        ),
                        MealItemMetaData(
                            icon: Icons.work, label: mealComplexity.toString()),
                        const SizedBox(
                          width: 10,
                        ),
                        MealItemMetaData(
                            icon: Icons.money,
                            label: mealAffordibility.toString())
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
