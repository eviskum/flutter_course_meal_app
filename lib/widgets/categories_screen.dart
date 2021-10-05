import 'package:flutter/material.dart';
import 'package:flutter_course_meal_app/widgets/category_item.dart';

// import '../models/category.dart';
import '../models/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200, childAspectRatio: 3 / 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
      children: DUMMY_CATEGORIES.map((e) {
        return CategoryItem(e.id, e.title, e.color);
      }).toList(),
    );
/*     return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeals'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200, childAspectRatio: 3 / 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
        children: DUMMY_CATEGORIES.map((e) {
          return CategoryItem(e.id, e.title, e.color);
        }).toList(),
      ),
    );
 */
  }
}
