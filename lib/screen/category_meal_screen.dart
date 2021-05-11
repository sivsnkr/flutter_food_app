import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../widget/meal_item.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final title;
  // CategoryMealScreen(this.title);
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final title = routeArgs['title'];
    final catId = routeArgs['id'];

    final filteredMeals =
        DUMMY_MEALS.where((meal) => meal.categories.contains(catId)).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(filteredMeals[index]);
          },
          itemCount: filteredMeals.length,
        ),
      ),
    );
  }
}
