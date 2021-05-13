import 'package:flutter/material.dart';

import '../data/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function toggleFavourites;
  final Function isFavouriteMeal;
  MealDetailScreen(this.toggleFavourites, this.isFavouriteMeal);
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Ingredients',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: selectedMeal.ingredients.map((item) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          child: Text(
                            item,
                          ),
                        ),
                        color: Theme.of(context).accentColor,
                      ),
                    );
                  }).toList(),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Steps',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: List.generate(selectedMeal.steps.length, (index) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text('#${(1 + index)}'),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          child: Text(
                            selectedMeal.steps[index],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavouriteMeal(mealId) ? Icons.star : Icons.star_border),
        onPressed: () {
          toggleFavourites(mealId);
        },
      ),
    );
  }
}
