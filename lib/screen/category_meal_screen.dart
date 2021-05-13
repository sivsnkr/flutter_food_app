import 'package:flutter/material.dart';

// import '../data/dummy_data.dart';
import '../widget/meal_item.dart';
import '../models/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;
  CategoryMealScreen(this.availableMeals);
  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String title;
  List<Meal> filteredMeals;
  bool _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, Object>;
      title = routeArgs['title'];
      final catId = routeArgs['id'];

      filteredMeals = widget.availableMeals
          .where((meal) => meal.categories.contains(catId))
          .toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _deleteMeal(String mealId) {
    setState(() {
      filteredMeals.removeWhere(
        (meal) => meal.id == mealId,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: filteredMeals.length == 0
            ? Container(
                margin: EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    "We are cooking something for here.",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return MealItem(filteredMeals[index], _deleteMeal);
                },
                itemCount: filteredMeals.length,
              ),
      ),
    );
  }
}
