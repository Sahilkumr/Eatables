import 'package:eatables/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavouriteMealsNotifier() : super([]);

  bool toggleFavouriteMeals(Meal meal) {
    final isFavMeal = state.contains(meal);

    if (isFavMeal) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    }
    else{
    state = [...state,meal];
    return true;
    }
  }
}

final favouriteMealsProvider =
    StateNotifierProvider<FavouriteMealsNotifier, List<Meal>>((ref) => FavouriteMealsNotifier(),
);
