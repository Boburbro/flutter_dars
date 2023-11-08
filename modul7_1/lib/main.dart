import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modul7_1/models/category.dart';
import 'package:modul7_1/models/meal.dart';
import 'package:modul7_1/screens/botton_navigator_bar.dart';

import 'package:modul7_1/screens/category_meal_screen.dart';
import 'package:modul7_1/screens/meal_details.dart';
import 'package:modul7_1/screens/notfoundscreen.dart';
import 'package:modul7_1/screens/tab_screen.dart';

void main(List<String> args) {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _categories = Categories();

  final _meal = Meals();

  void changeLike(String _id) {
    setState(() {
      _meal.addToLiked(_id);
    });
  }

  bool isLiked(String mId) {
    return _meal.liked.any((meal) => meal.mId == mId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.amber,
          fontFamily: GoogleFonts.aBeeZee().fontFamily),
      debugShowCheckedModeBanner: false,
      // home: ,
      initialRoute: '/',
      routes: {
        "/": (context) => BottanNavigatoBarScreen(_categories.list, _meal.item, _meal.liked, changeLike, isLiked),
        TabScreen.routeName: (context) =>
            TabScreen(_categories.list, _meal.item, _meal.liked, changeLike, isLiked),
        CategoryMealScreen.routeName: (context) =>
            CategoryMealScreen(changeLike, isLiked),
        MealDetails.routeName: (context) => MealDetails(0),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => const NotFoundScreen());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => const NotFoundScreen());
      },
    );
  }
}
