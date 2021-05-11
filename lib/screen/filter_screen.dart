import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {
  static const routeName = '/filter-meal';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Meals'),
      ),
      body: Container(
        child: Center(
          child: Text('Filter your Meals here'),
        ),
      ),
    );
  }
}
