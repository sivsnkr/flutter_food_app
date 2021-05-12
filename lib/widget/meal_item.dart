import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../screen/meal_detail.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final Function deleteMeal;
  MealItem(this.meal, this.deleteMeal);
  void selectMeal(ctx) {
    Navigator.of(ctx)
        .pushNamed(MealDetailScreen.routeName, arguments: meal.id)
        .then((res) {
      if (res != null) {
        deleteMeal(res);
      }
    });
  }

  String get complexityText {
    switch (meal.complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      default:
        return 'Hard';
    }
  }

  String get affordableText {
    switch (meal.affordability) {
      case Affordability.Luxurious:
        return 'Luxurious';
      case Affordability.Affordable:
        return 'Affordable';
      default:
        return 'Pricey';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () => selectMeal(context),
        child: Container(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                15,
              ),
            ),
            elevation: 4,
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      child: Image.network(
                        meal.imageUrl,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 10,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        width: 250,
                        color: Colors.black54,
                        child: Text(
                          meal.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.schedule,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              '${meal.duration} mins',
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.work,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              '$complexityText',
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.attach_money,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              '$affordableText',
                            ),
                          ],
                        )
                      ],
                    ))
              ],
            ),
          ),
          margin: EdgeInsets.all(10),
        ),
      ),
    );
  }
}
