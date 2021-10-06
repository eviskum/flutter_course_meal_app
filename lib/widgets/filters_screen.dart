import 'package:flutter/material.dart';
// import 'package:flutter_course_meal_app/models/dummy_data.dart';
import 'package:flutter_course_meal_app/models/filter.dart';
// import 'package:flutter_course_meal_app/models/meal.dart';
import 'package:flutter_course_meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters-screen';

  final List<Filter> filters;
  final Function applyFilters;

  const FiltersScreen(this.filters, this.applyFilters, {Key? key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  // List<Filter> filters = [
  //   Filter(title: 'Gluten-free', subTitle: 'Only include gluten free meals'),
  //   Filter(title: 'Lactose-free', subTitle: 'Only include lactose free meals'),
  //   Filter(title: 'Vegan', subTitle: 'Only include vegan meals'),
  //   Filter(title: 'Vegetarian', subTitle: 'Only include vegetarian meals'),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text('Adjust your meal selection', style: Theme.of(context).textTheme.headline6),
          ),
          Expanded(
            child: ListView(
              children: [
                filterSwitch(mealFilters.gluten.index),
                filterSwitch(mealFilters.lactose.index),
                filterSwitch(mealFilters.vegan.index),
                filterSwitch(mealFilters.vegetarian.index),
              ],
            ),
          )
        ],
      ),
      drawer: const MainDrawer(),
    );
  }

  SwitchListTile filterSwitch(int filterIdx) {
    return SwitchListTile.adaptive(
      value: widget.filters[filterIdx].filterState,
      onChanged: (val) {
        setState(() {
          widget.filters[filterIdx].filterState = val;
          widget.applyFilters();
        });
      },
      title: Text(widget.filters[filterIdx].title),
      subtitle: Text(widget.filters[filterIdx].subTitle),
    );
  }
}
