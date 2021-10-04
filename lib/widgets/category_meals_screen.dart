import 'package:flutter/material.dart';

import '../models/dummy_data.dart';

import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String routeName = '/category-meals';

  // final String categoryId;
  // final String categoryTitle;

  // const CategoryMealsScreen(this.categoryId, this.categoryTitle, {Key? key}) : super(key: key);
  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String categoryId = args['id']!;
    final String categoryTitle = args['title']!;
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, idx) {
          return MealItem(
              id: categoryMeals[idx].id,
              title: categoryMeals[idx].title,
              imageUrl: categoryMeals[idx].imageUrl,
              duration: categoryMeals[idx].duration,
              complexity: categoryMeals[idx].complexity,
              affordability: categoryMeals[idx].affordability);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
