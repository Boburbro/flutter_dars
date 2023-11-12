// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:modul7_1/models/meal.dart';
import 'package:modul7_1/screens/add_new_item.dart';
import 'package:modul7_1/widget/main_drower.dart';

// ignore: must_be_immutable
class Items extends StatelessWidget {
  // ignore: prefer_final_fields
  List<Meal> _items = Meals().item;

  static const routeName = '/items';

  void _goToAddNewItemScreen(BuildContext context) {
    Navigator.of(context).pushNamed(AddNewItem.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Items"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                _goToAddNewItemScreen(context);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      drawer: const MainDrower(),
      body: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (ctx, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Card(
                child: ListTile(
                  leading: CircleAvatar(
                      backgroundImage: AssetImage(_items[index].imgUrl)),
                  title: Text(_items[index].title),
                  subtitle: Text("${_items[index].price}\$"),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete_forever,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
