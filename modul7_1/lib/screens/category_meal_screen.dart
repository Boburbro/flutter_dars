import 'package:flutter/material.dart';
import 'package:modul7_1/models/meal.dart';
import 'package:modul7_1/widget/mealitem.dart';

class CategoryMealScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final title = categoryData['cTitle'];
    final _meals = categoryData['cData'] as List<Meal>;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: _meals.length! > 0
          ? ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: _meals.length,
              itemBuilder: (ctx, index) => MealItem(_meals[index]),
            )
          : const Center(
              child: Text("Hozircha bu katalogda maxsulotlar yo'q"),
            ),
    );
  }
}
