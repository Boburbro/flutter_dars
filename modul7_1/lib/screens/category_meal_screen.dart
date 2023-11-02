import 'package:flutter/material.dart';
import 'package:modul7_1/screens/mealitem.dart';

class CategoryMealScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final categoryTitle = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        // itemCount: 5,
        itemBuilder: (ctx, index) => const MealItem(),
      ),
    );
  }
}
