import 'package:flutter/material.dart';
import 'package:modul7_1/models/meal.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({super.key});

  static const routeName = '/meal-details';

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable, no_leading_underscores_for_local_identifiers
    final _mealData = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_mealData.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              _mealData.imgUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 250,
            ),
            Text(
              "\$${_mealData.price}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Tarifi:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(_mealData.description),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: Card(
                child: ListView.separated(
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (ctx, index) {
                      return Text(_mealData.ingredients[index]);
                    },
                    separatorBuilder: (ctx, index) {
                      return const Divider();
                    },
                    itemCount: _mealData.ingredients.length),
              ),
            )
          ],
        ),
      ),
    );
  }
}
