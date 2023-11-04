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

class App extends StatelessWidget {
  final _categories = Categories();
  final _meal = Meals();

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
        "/": (context) => BottanNavigatoBarScreen(_categories.list, _meal.item),
        TabScreen.routeName: (context) =>
            TabScreen(_categories.list, _meal.item),
        CategoryMealScreen.routeName: (context) => CategoryMealScreen(),
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
