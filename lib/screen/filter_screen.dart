import 'package:flutter/material.dart';

import '../widget/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter-meal';
  final Function updateFilter;
  final filterState;
  FilterScreen(this.updateFilter, this.filterState);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  @override
  void initState() {
    _glutenFree = widget.filterState['gluten'];
    _lactoseFree = widget.filterState['lactose'];
    _vegan = widget.filterState['vegan'];
    _vegetarian = widget.filterState['vegetarian'];
    super.initState();
  }

  void saveFilter() {
    widget.updateFilter({
      'gluten': _glutenFree,
      'vegetarian': _vegetarian,
      'vegan': _vegan,
      'lactose': _lactoseFree,
    });
  }

  Widget _buildSwitchListTile(
      String title, String description, bool value, Function handler) {
    return SwitchListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 18),
      ),
      subtitle: Text(
        description,
        style: TextStyle(fontSize: 16),
      ),
      value: value,
      onChanged: handler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Meals'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: saveFilter,
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Text(
                  'Adjust your meal selection.',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile(
                    'Gluten Free',
                    'You will only see gluten free meals.',
                    _glutenFree,
                    (value) {
                      setState(() {
                        _glutenFree = value;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    'Lactose Free',
                    'You will only see lactose free meals.',
                    _lactoseFree,
                    (value) {
                      setState(() {
                        _lactoseFree = value;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    'Vegetarian',
                    'You will only see Vegetarian meals.',
                    _vegetarian,
                    (value) {
                      setState(() {
                        _vegetarian = value;
                      });
                    },
                  ),
                  _buildSwitchListTile(
                    'Vegan',
                    'You will only see Vegan meals.',
                    _vegan,
                    (value) {
                      setState(() {
                        _vegan = value;
                      });
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
