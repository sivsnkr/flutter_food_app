import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widget/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;
  final Function isFavouriteMeal;
  FavouritesScreen(this.favouriteMeals, this.isFavouriteMeal);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: favouriteMeals.length == 0
            ? Center(
                child: Text(
                  "You don't have any favourite meals!",
                  style: Theme.of(context).textTheme.headline6,
                ),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return MealItem(favouriteMeals[index], () {});
                },
                itemCount: favouriteMeals.length,
              ),
      ),
    );
  }
}
