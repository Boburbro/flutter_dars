import 'package:flutter/material.dart';
import 'package:modul7_1/models/category.dart';
import 'package:modul7_1/models/meal.dart';
import 'package:modul7_1/widget/category_items.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Category> _categories;
  final List<Meal> _meals;

  // ignore: use_key_in_widget_constructors
  const CategoriesScreen(this._categories, this._meals);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_is_empty
    return _meals.length > 0
        ? GridView(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            children: _categories.map(
              (category) {
                final meals = _meals
                    .where(
                      (e) => e.categoryId == category.id,
                    )
                    .toList();
                return category_item(category.title, category.imgurl, meals);
              },
            ).toList(),
          )
        : const Center(
            child: Text(
              "Hozircha kategoryalar mavjud emas",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          );
  }
}
