// ignore: duplicate_ignore
// ignore_for_file: use_key_in_widget_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:modul7_1/models/meal.dart';
import 'package:modul7_1/widget/mealitem.dart';

// ignore: use_key_in_widget_constructors
class CategoryMealScreen extends StatelessWidget {
  final Function changeLike;
  final Function isLiked;
  static const routeName = "/category-meals";

  // ignore: prefer_const_constructors_in_immutables
  CategoryMealScreen(this.changeLike, this.isLiked);

  @override
  Widget build(BuildContext context) {
    final categoryData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final title = categoryData['cTitle'];
    // ignore: no_leading_underscores_for_local_identifiers
    final _meals = categoryData['cData'] as List<Meal>;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      // ignore: prefer_is_empty
      body: _meals.length > 0
          ? ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: _meals.length,
              itemBuilder: (ctx, index) => MealItem(_meals[index], changeLike, isLiked),
            )
          : const Center(
              child: Text("Hozircha bu katalogda maxsulotlar yo'q"),
            ),
    );
  }
}
