import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../widget/category_card.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        padding: EdgeInsets.all(25),
        children: DUMMY_CATEGORIES.map((cat) {
          return CustomCategoryCard(
            cat.title,
            cat.color,
            cat.id,
          );
        }).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
