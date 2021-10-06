import 'package:flutter/material.dart';
import 'package:flutter_course_meal_app/models/meal.dart';
import 'package:flutter_course_meal_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoritesScreen(this.favoriteMeals, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty
        ? const Center(
            child: Text('No Favorites Yet !!!'),
          )
        : ListView.builder(
            itemBuilder: (context, idx) {
              return MealItem(
                  id: favoriteMeals[idx].id,
                  title: favoriteMeals[idx].title,
                  imageUrl: favoriteMeals[idx].imageUrl,
                  duration: favoriteMeals[idx].duration,
                  complexity: favoriteMeals[idx].complexity,
                  affordability: favoriteMeals[idx].affordability);
            },
            itemCount: favoriteMeals.length,
          );
  }
}
