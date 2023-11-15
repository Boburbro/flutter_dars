import 'package:flutter/material.dart';
import 'package:modul7_2/model/category.dart';
import 'package:modul7_2/model/meal.dart';
import 'package:modul7_2/screens/home/category_list.dart';

class CategoryBuild extends StatelessWidget {
  final Category _category;
  final List<Meal> _meals;
  const CategoryBuild(this._category, this._meals, {super.key});

  void _goToCategoryCardScreen(BuildContext context) {
    final meals =
        _meals.where((element) => element.cId == _category.cId).toList();
    Navigator.of(context).pushNamed(CategoryCard.routeName,
        arguments: {"title": _category.title, "meals": meals});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _goToCategoryCardScreen(context);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                _category.imgUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black26,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                _category.title,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
