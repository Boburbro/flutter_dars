import 'package:flutter/material.dart';

import 'package:modul7_1/models/category.dart';
import 'package:modul7_1/models/meal.dart';
import 'package:modul7_1/screens/categories_screen.dart';
import 'package:modul7_1/screens/favorites_screen.dart';
import 'package:modul7_1/widget/main_drower.dart';

class TabScreen extends StatelessWidget {
  static const routeName = "/2";
  // ignore: unused_field
  final List<Category> _categories;
  // ignore: unused_field
  final List<Meal> _meals;
  final List<Meal> _liked;
  final Function changeLiked;
  final Function isLiked;

  // ignore: use_key_in_widget_constructors
  const TabScreen(this._categories, this._meals, this._liked, this.changeLiked,
      this.isLiked);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Ovqatlar menyusi"),
          centerTitle: true,
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.more_horiz),
              text: "Barchasi",
            ),
            Tab(
              icon: Icon(Icons.favorite),
              text: "Sevimlilar",
            )
          ]),
        ),
        drawer: const MainDrower(),
        body: TabBarView(children: [
          CategoriesScreen(_categories, _meals),
          FavoritesScreen(_liked, changeLiked, isLiked),
        ]),
      ),
    );
  }
}
