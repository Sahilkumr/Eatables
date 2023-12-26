import 'package:eatables/models/meal.dart';
import 'package:eatables/screens/categories.dart';
import 'package:eatables/screens/meals.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> favMeals = [];

  void _toggleFavMeals(Meal meal) {
    final mealExists = favMeals.contains(meal);
    if (mealExists) {
      setState(() {
        _showInfoMessage('Meal Already Exist.');
        favMeals.remove(meal);
      });
    } else {
      setState(() {
        _showInfoMessage('Meal Added to Favourites.');
        favMeals.add(meal);
      });
    }
  }

  void _showInfoMessage(String message){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content:  Text(message),duration:const Duration(seconds: 2),)
    );
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = CategoriesScreen(
      onToggleFavourite: _toggleFavMeals,
      favMeals: favMeals,
    );
    var activeScreenTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      activeScreen = MealScreen(
        meals: favMeals,
        onToggleFavourite: _toggleFavMeals,
        favMeals: favMeals,
      );
      activeScreenTitle = 'Your Favourite';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activeScreenTitle),
      ),
      body: activeScreen,
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
