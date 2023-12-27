import 'package:eatables/providers/favourite_provider.dart';
import 'package:eatables/providers/filters_provider.dart';
import 'package:eatables/providers/meal_provider.dart';
import 'package:eatables/screens/categories.dart';
import 'package:eatables/screens/filters.dart';
import 'package:eatables/screens/meals.dart';
import 'package:eatables/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const kinitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  // final List<Meal> favMeals = [];
  Map<Filter, bool> _selectedFitlers = kinitialFilters;

  // void _toggleFavMeals(Meal meal) {
  //   final mealExists = favMeals.contains(meal);
  //   if (mealExists) {
  //     setState(() {
  //       _showInfoMessage('Meal Already Exist.');
  //       favMeals.remove(meal);
  //     });
  //   } else {
  //     setState(() {
  //       _showInfoMessage('Meal Added to Favourites.');
  //       favMeals.add(meal);
  //     });
  //   }
  // }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setSelectedDrawerOption(String drawerOption) async {
    Navigator.of(context).pop();
    if (drawerOption == 'Filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FilterScreen(),
        ),
      );
      setState(() {
        _selectedFitlers = result ?? kinitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final availableMeals = meals.where((meal) {
      if (_selectedFitlers[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFitlers[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFitlers[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (_selectedFitlers[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      return true;
    }).toList();

    Widget activeScreen = CategoriesScreen(
      // onToggleFavourite: _toggleFavMeals,
      favMeals: ref.watch(favouriteMealsProvider),
    );
    var activeScreenTitle = 'Categories';

    final favouriteMeals = ref.watch(favouriteMealsProvider);

    if (_selectedPageIndex == 1) {
      activeScreen = MealScreen(
        meals: favouriteMeals,
        // onToggleFavourite: _toggleFavMeals,
        // favMeals: favouriteMeals,
      );
      activeScreenTitle = 'Your Favourite';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activeScreenTitle),
      ),
      body: activeScreen,
      drawer: MainDrawer(onSelectDrawerOption: _setSelectedDrawerOption),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Meals'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favourites')
        ],
      ),
    );
  }
}
