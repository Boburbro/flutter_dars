import 'package:flutter/material.dart';
import 'package:modul7_2/model/category.dart';
import 'package:modul7_2/model/meal.dart';
import 'package:modul7_2/widgets/categpry_build.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Category> _categoryitems;
  final List<Meal> _meals;
  const CategoriesScreen(this._categoryitems, this._meals, {super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: _categoryitems.map((e) => CategoryBuild(e, _meals)).toList(),
      );
  }
}