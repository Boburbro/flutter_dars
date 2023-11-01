import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modul7_1/models/category.dart';


import 'package:modul7_1/screens/categories_screen.dart';



void main(List<String> args) {
  runApp(App());
}

class App extends StatelessWidget {
  
  final _categories = Categories();

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: GoogleFonts.aBeeZee().fontFamily
      ),
      debugShowCheckedModeBanner: false,
      home: CategoriesScreen(_categories.list),
    );
  }
}