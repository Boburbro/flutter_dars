import 'package:flutter/material.dart';
import 'package:modul7_2/model/meal.dart';
import 'package:modul7_2/widgets/meal_card.dart';

class CategoryCard extends StatelessWidget {
  final Function changeLiked, isLiked;
  const CategoryCard(this.changeLiked,this.isLiked, {super.key});

  static const routeName = "/catgory-list";

  @override
  Widget build(BuildContext context) {
    final _data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final _meals = _data['meals'] as List<Meal>;
    final _title = _data['title'];

    return Scaffold(
      appBar: AppBar(
        title: Text("$_title"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: _meals.length,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          itemBuilder: (ctx, index) {
            return MealCard(_meals[index], changeLiked, isLiked);
          }),
    );
  }
}
