import 'package:flutter/material.dart';

import '../widget/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter-meal';

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Meals'),
      ),
      drawer: MainDrawer(),
      body: Container(
        child: Center(
          child: Text('Filter your Meals here'),
        ),
      ),
    );
  }
}
