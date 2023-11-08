import 'package:flutter/material.dart';
import 'package:modul7_1/models/meal.dart';
import 'package:modul7_1/widget/mealitem.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> _liked;
  final Function changeLiked;
  final Function isLiked;

  const FavoritesScreen(this._liked, this.changeLiked, this.isLiked, {super.key});

  @override
  Widget build(BuildContext context) {
    return _liked.length > 0
        ? ListView.builder(
            padding: const EdgeInsets.all(15),
            itemCount: _liked.length,
            itemBuilder: (ctx, index) =>
                MealItem(_liked[index], changeLiked, isLiked),
          )
        : const Center(
            child: Text("Hozircha bu katalogda maxsulotlar yo'q"),
          );
  }
}
