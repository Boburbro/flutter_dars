import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modul7_2/model/category.dart';
import 'package:modul7_2/model/meal.dart';
import 'package:modul7_2/screens/home/category_list.dart';
import 'package:modul7_2/screens/home/home.dart';
import 'package:modul7_2/screens/home/meal_data.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _categories = Categories();

  final _meals = Meals();

  void changeLiked(String mId) {
    setState(
      () {
        _meals.changeLiked(mId);
      },
    );
  }

  bool isLiked(String mId) {
    return _meals.liked.any((element) => element.mId == mId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: GoogleFonts.aBeeZee().fontFamily,
          primarySwatch: Colors.amber),
      initialRoute: "/",
      routes: {
        Home.routeName: (context) => Home(
              _categories.item,
              _meals.items,
              _meals.liked,
              changeLiked,
              isLiked,
            ),
        CategoryCard.routeName: (context) => CategoryCard(changeLiked, isLiked),
        MealDataScreen.routeName: (context) => const MealDataScreen(),
      },
    );
  }
}
