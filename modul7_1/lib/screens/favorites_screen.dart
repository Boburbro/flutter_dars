import 'package:flutter/material.dart';
import 'package:modul7_1/models/meal.dart';
import 'package:modul7_1/widget/mealitem.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Meal> _liked;
  final Function changeLiked;
  final Function isLiked;

  const FavoritesScreen(this._liked, this.changeLiked, this.isLiked,
      {super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  void _changeLike(String mId) {
    setState(() {
      widget.changeLiked(mId);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Are you sure'),
        action: SnackBarAction(
          label: 'NO',
          onPressed: () {
            widget.changeLiked(mId);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_is_empty
    return  widget._liked.length > 0
        ? ListView.builder(
            padding: const EdgeInsets.all(15),
            itemCount: widget._liked.length,
            itemBuilder: (ctx, index) =>
                MealItem(widget._liked[index], _changeLike, widget.isLiked),
          )
        : const Center(
            child: Text("Hozircha bu katalogda maxsulotlar yo'q"),
          );
  }
}
