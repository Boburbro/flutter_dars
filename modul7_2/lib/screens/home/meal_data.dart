import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:modul7_2/model/meal.dart';

class MealDataScreen extends StatelessWidget {
  const MealDataScreen({super.key});

  static const routeName = 'meal-data-screen';

  @override
  Widget build(BuildContext context) {
    final _meal = ModalRoute.of(context)!.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(title: Text("${_meal.title}")),
      body: Column(children: [
        CarouselSlider(
          items: _meal.imgUrls.map((e) {
            return Image.asset(e);
          }).toList(),
          options: CarouselOptions(
            initialPage: 0,
            viewportFraction: 1,
          ),
        ),
      ]),
    );
  }
}
