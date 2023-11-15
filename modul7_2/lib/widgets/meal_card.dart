import 'package:flutter/material.dart';
import 'package:modul7_2/model/meal.dart';
import 'package:modul7_2/screens/home/meal_data.dart';

class MealCard extends StatelessWidget {
  final Meal _meal;
  final Function changeLiked, isLiked;

  const MealCard(this._meal, this.changeLiked, this.isLiked, {super.key});

  _goToMealDataScreen(BuildContext context) {
    Navigator.of(context).pushNamed(MealDataScreen.routeName, arguments: _meal);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _goToMealDataScreen(context);
      },
      child: Card(
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: _meal.imgUrl.startsWith("assets/")
                        ? Image.asset(
                            _meal.imgUrl,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            _meal.imgUrl,
                            fit: BoxFit.cover,
                          ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      alignment: Alignment.bottomRight,
                      padding: const EdgeInsets.all(10),
                      width: 200,
                      color: Colors.black38,
                      child: Text(
                        _meal.title,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {
                        changeLiked(_meal.mId);
                      },
                      icon: Icon(isLiked(_meal.mId)
                          ? Icons.favorite
                          : Icons.favorite_outline_sharp),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.monetization_on_outlined),
                        const SizedBox(
                          width: 2,
                        ),
                        Text("${_meal.price}"),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.watch_later_outlined),
                        const SizedBox(
                          width: 2,
                        ),
                        Text("${_meal.preparingTime} minut"),
                      ],
                    ),
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
