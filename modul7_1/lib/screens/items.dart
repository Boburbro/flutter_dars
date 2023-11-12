// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:modul7_1/models/meal.dart';
import 'package:modul7_1/screens/add_new_item.dart';
import 'package:modul7_1/widget/main_drower.dart';

// ignore: must_be_immutable
class Items extends StatefulWidget {
  // ignore: prefer_final_fields
  // List<Meal> _items = Meals().item;
  final List<Meal> _items;
  final Function _removeItem;

  Items(this._items, this._removeItem);
  static const routeName = '/items';

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  void _goToAddNewItemScreen(BuildContext context) {
    Navigator.of(context).pushNamed(AddNewItem.routeName).then((value) {
      if (value == true) {
        setState(() {});
      }
    });
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
          itemCount: widget._items.length,
          itemBuilder: (ctx, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Card(
                child: ListTile(
                  leading: CircleAvatar(
                      backgroundImage:
                          widget._items[index].imgUrl.startsWith("assets/")
                              ? AssetImage(widget._items[index].imgUrl)
                              : NetworkImage(widget._items[index].imgUrl)
                                  as ImageProvider),
                  title: Text(widget._items[index].title),
                  subtitle: Text("${widget._items[index].price}\$"),
                  trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        widget._removeItem(widget._items[index].mId);
                      });
                    },
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
