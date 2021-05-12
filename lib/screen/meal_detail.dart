import 'package:flutter/material.dart';

import '../data/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
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
              // Container(
              //   height: 200,
              //   width: 300,
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     border: Border.all(color: Colors.grey),
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              //   margin: const EdgeInsets.all(10),
              //   padding: const EdgeInsets.all(10),
              //   child: ListView.builder(
              //     itemBuilder: (ctx, index) {
              //       return Card(
              //         child: Padding(
              //           padding: const EdgeInsets.symmetric(
              //             vertical: 5,
              //             horizontal: 10,
              //           ),
              //           child: Text(
              //             selectedMeal.ingredients[index],
              //           ),
              //         ),
              //         color: Theme.of(context).accentColor,
              //       );
              //     },
              //     itemCount: selectedMeal.ingredients.length,
              //   ),
              // ),
              Container(
                // height: 200,
                // width: 300,
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //   border: Border.all(color: Colors.grey),
                //   borderRadius: BorderRadius.circular(10),
                // ),
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
              // Container(
              //   height: 200,
              //   width: 300,
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     border: Border.all(color: Colors.grey),
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              //   margin: const EdgeInsets.all(10),
              //   padding: const EdgeInsets.all(10),
              //   child: ListView.builder(
              //     itemBuilder: (ctx, index) {
              // return ListTile(
              //   leading: CircleAvatar(child: Text('#${(index + 1)}')),
              //   title: Padding(
              //     padding: const EdgeInsets.symmetric(
              //       vertical: 5,
              //       horizontal: 10,
              //     ),
              //     child: Text(
              //       selectedMeal.steps[index],
              //     ),
              //   ),
              // );
              //     },
              //     itemCount: selectedMeal.steps.length,
              //   ),
              // ),
              Container(
                // height: 200,
                // width: 300,
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //   border: Border.all(color: Colors.grey),
                //   borderRadius: BorderRadius.circular(10),
                // ),
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
        child: Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
      ),
    );
  }
}
