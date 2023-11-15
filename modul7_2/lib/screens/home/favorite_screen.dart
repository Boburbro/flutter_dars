import 'package:flutter/material.dart';
import 'package:modul7_2/model/meal.dart';
import 'package:modul7_2/widgets/meal_card.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> _likedMeals;
  final Function changeLiked;
  final Function isLiked;
  const FavoriteScreen(this._likedMeals, this.changeLiked, this.isLiked,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _likedMeals.length,
        itemBuilder: ((context, index) {
          return MealCard(_likedMeals[index], changeLiked, isLiked);
        }));
  }
}
