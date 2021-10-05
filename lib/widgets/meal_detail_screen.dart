import 'package:flutter/material.dart';
import 'package:flutter_course_meal_app/models/dummy_data.dart';
import 'package:flutter_course_meal_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = '/meal-detail-screen';

  const MealDetailScreen({Key? key}) : super(key: key);

  Container sectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Container sectionContainer(Widget content) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: content,
    );
  }

  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover),
            ),
            sectionTitle(context, 'Ingredients'),
            sectionContainer(
              ListView.builder(
                itemBuilder: (context, idx) => Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(selectedMeal.ingredients[idx]),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            sectionTitle(context, 'Steps'),
            sectionContainer(
              ListView.builder(
                itemBuilder: (context, idx) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${idx + 1}'),
                      ),
                      title: Text(selectedMeal.steps[idx]),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
