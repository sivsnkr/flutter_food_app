import 'package:flutter/material.dart';

import './data/dummy_data.dart';
import './screen/tab_screen.dart';
import './screen/category_meal_screen.dart';
import './screen/meal_detail.dart';
import './screen/filter_screen.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'vegetarian': false,
    'vegan': false,
    'lactose': false,
  };

  void _updateFilter(Map<String, bool> newFilter) {
    setState(() {
      _filters = newFilter;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) return false;
        if (_filters['vegetarian'] && !meal.isVegetarian) return false;
        if (_filters['vegan'] && !meal.isVegan) return false;
        if (_filters['lactose'] && !meal.isLactoseFree) return false;
        return true;
      }).toList();
    });
  }

  void _toggleFavouriteMeals(String mealId) {
    final mealIndex = _favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (mealIndex < 0) {
      setState(() {
        _favouriteMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    } else {
      setState(() {
        _favouriteMeals.removeAt(mealIndex);
      });
    }
  }

  bool _isFavouriteMeal(String mealId) {
    return _favouriteMeals.indexWhere((meal) => meal.id == mealId) >= 0;
  }

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: MyHomePage(),
      routes: {
        '/': (ctx) => TabsScreen(_favouriteMeals, _isFavouriteMeal),
        CategoryMealScreen.routeName: (ctx) =>
            CategoryMealScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(_toggleFavouriteMeals, _isFavouriteMeal),
        FilterScreen.routeName: (ctx) => FilterScreen(_updateFilter, _filters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}
