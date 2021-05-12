import 'package:flutter/material.dart';

import '../screen/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(ctx, handler, title, icon) {
    return ListTile(
      leading: Icon(icon),
      onTap: handler,
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking up!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
            context,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
            'Meal',
            Icons.restaurant,
          ),
          buildListTile(
            context,
            () {
              Navigator.of(context)
                  .pushReplacementNamed(FilterScreen.routeName);
            },
            'Filter',
            Icons.settings,
          ),
        ],
      ),
    );
  }
}
