import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:modul7_1/models/meal.dart';
import 'package:modul7_1/widget/dotForItem.dart';

// ignore: must_be_immutable
class MealDetails extends StatefulWidget {
   int activeImgIndex = 0;
  MealDetails(
    this.activeImgIndex,
    {super.key});

  static const routeName = '/meal-details';

  @override
  State<MealDetails> createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
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
            CarouselSlider(
              items: _mealData.imgUrls.map(
                (img) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Image(
                      image: NetworkImage(img),
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ).toList(),
              options: CarouselOptions(
                initialPage: 0,
                onPageChanged: (index, reason) {
                  setState(() {
                    widget.activeImgIndex = index;
                  });
                },
                height: 300,
                viewportFraction: 1,
              ),
            ),
            DotForItem(_mealData.imgUrls, widget.activeImgIndex),
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
