import 'package:flutter/material.dart';
import 'package:flutter_course_meal_app/models/dummy_data.dart';
import 'package:flutter_course_meal_app/models/filter.dart';
import 'package:flutter_course_meal_app/models/meal.dart';
import 'package:flutter_course_meal_app/widgets/filters_screen.dart';
import 'package:flutter_course_meal_app/widgets/tabs_screen.dart';

// import './widgets/categories_screen.dart';
import './widgets/category_meals_screen.dart';
import './widgets/meal_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Filter> _filters = [
    Filter(title: 'Gluten-free', subTitle: 'Only include gluten free meals'),
    Filter(title: 'Lactose-free', subTitle: 'Only include lactose free meals'),
    Filter(title: 'Vegan', subTitle: 'Only include vegan meals'),
    Filter(title: 'Vegetarian', subTitle: 'Only include vegetarian meals'),
  ];

  List<Meal> _selectedMeals = DUMMY_MEALS;
  final List<Meal> _favoriteMeals = [];

  void _applyFilters() {
    _selectedMeals = DUMMY_MEALS.where((element) {
      if (_filters[mealFilters.gluten.index].filterState && !element.isGlutenFree) return false;
      if (_filters[mealFilters.lactose.index].filterState && !element.isLactoseFree) return false;
      if (_filters[mealFilters.vegan.index].filterState && !element.isVegan) return false;
      if (_filters[mealFilters.vegetarian.index].filterState && !element.isVegetarian) return false;
      return true;
    }).toList();
  }

  void _toggleFavorite(String id) {
    final existingIdx = _favoriteMeals.indexWhere((element) => element.id == id);
    if (existingIdx >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIdx);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((element) => element.id == id));
      });
    }
  }

  bool _isFavoriteMeals(String id) {
    return _favoriteMeals.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      primarySwatch: Colors.pink,
      canvasColor: const Color.fromRGBO(255, 254, 229, 1),
      fontFamily: 'Raleway',
      textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'RobotoCondensed',
            ),
          ),
    );
    return MaterialApp(
      title: 'DeliMeals',
      theme: theme.copyWith(colorScheme: theme.colorScheme.copyWith(secondary: Colors.amber)),
      // home: const CategoriesScreen(),
      home: TabsScreen(_favoriteMeals),
      routes: {
        // '/': (context) => const TabsScreen(),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(_selectedMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(_selectedMeals, _toggleFavorite, _isFavoriteMeals),
        FiltersScreen.routeName: (context) => FiltersScreen(_filters, _applyFilters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
