import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_detail.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(this.meals, {super.key, this.title});

  final String? title;
  final List<Meal> meals;

  void _selectedMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailScreen(meal: meal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (title == null) {
      return meals.isEmpty
          ? Text('AÚN NO HAY COMIDAS DISPONIBLES')
          : ListView.builder(
              itemCount: meals.length,
              itemBuilder: (ctx, index) => MealItem(
                meal: meals[index],
                onSelectMeal: (meal) {
                  _selectedMeal(context, meal);
                },
              ),
            );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: meals.isEmpty
            ? Text('AÚN NO HAY COMIDAS DISPONIBLES')
            : ListView.builder(
                itemCount: meals.length,
                itemBuilder: (ctx, index) => MealItem(
                  meal: meals[index],
                  onSelectMeal: (meal) {
                    _selectedMeal(context, meal);
                  },
                ),
              ),
      );
    }
  }
}
