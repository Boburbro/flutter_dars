import 'package:flutter/material.dart';
import 'package:modul7_1/models/meal.dart';
import 'package:modul7_1/screens/meal_details.dart';

class MealItem extends StatelessWidget {
  final Meal _meal;
  const MealItem(
    this._meal, {
    super.key,
  });

  // ignore: unused_element
  void _goToMealDetails(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetails.routeName, arguments: _meal);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _goToMealDetails(context);
      },
      child: Card(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Column(
            children: [
              Stack(
                children: [
                  // ignore: sized_box_for_whitespace
                  Container(
                    width: double.infinity,
                    height: 200,
                    child: Image.asset(
                      _meal.imgUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      alignment: Alignment.centerRight,
                      width: 200,
                      padding: const EdgeInsets.all(10),
                      color: Colors.black.withOpacity(0.5),
                      child: Text(
                        _meal.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_outline,
                          color: Colors.black54,
                          size: 20,
                        )),
                    Text("\$${_meal.price}"),
                    Text("${_meal.preparingTime} minut"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
