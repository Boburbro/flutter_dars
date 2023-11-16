import 'package:flutter/material.dart';
import 'package:modul7_2/model/meal.dart';
import 'package:modul7_2/widgets/meal_card.dart';

class FavoriteScreen extends StatefulWidget {
  final List<Meal> _likedMeals;
  final Function _changeLiked;
  final Function isLiked;
  const FavoriteScreen(this._likedMeals, this._changeLiked, this.isLiked,
      {super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  void changeLiked(String mId) {
    setState(() {
      widget._changeLiked(mId);
    });
    restartMeal(context, mId);
  }

  void restartMeal(BuildContext context, String mId) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Ovqatni sevimlidan chiqardingiz"),
      action: SnackBarAction(
          label: "QAYTARISH",
          onPressed: () {
            setState(() {
              widget._changeLiked(mId);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget._likedMeals.length,
        itemBuilder: ((context, index) {
          return MealCard(
              widget._likedMeals[index], changeLiked, widget.isLiked);
        }));
  }
}
