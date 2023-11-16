import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:modul7_2/model/meal.dart';
import 'package:modul7_2/widgets/dotForImg.dart';

class MealDataScreen extends StatefulWidget {
  MealDataScreen({super.key});

  static const routeName = '/meal-data-screen';

  @override
  State<MealDataScreen> createState() => _MealDataScreenState();
}

class _MealDataScreenState extends State<MealDataScreen> {
  int activeImgIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(title: Text("${_meal.title}")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              items: _meal.imgUrls.map((e) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    e,
                    fit: BoxFit.cover,
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    activeImgIndex = index;
                  });
                },
                initialPage: 0,
                viewportFraction: 1,
                height: 300,
              ),
            ),
            DotForImg(activeImgIndex, _meal.imgUrls),
            Text(
              "\$${_meal.price}",
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
                        "Tarif: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(_meal.description),
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 200,
              child: Card(
                child: ListView.separated(
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (ctx, index) {
                      return Text(_meal.ingredients[index]);
                    },
                    separatorBuilder: (ctx, index) {
                      return const Divider();
                    },
                    itemCount: _meal.ingredients.length),
              ),
            )
          ],
        ),
      ),
    );
  }
}
