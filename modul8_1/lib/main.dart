// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:modul8_1/screens/home.dart';
import 'package:modul8_1/screens/product_detals.dart';
import 'package:modul8_1/style/them.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  ThemeData them = MyTheme.them;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: them,
      home: HomeScreen(),
      initialRoute: "/",
      routes: {
        HomeScreen.routeName:(context) => HomeScreen(),
        ProductDetals.routeName:(context) => const ProductDetals()

      },
    );
    
  }
}
