// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../screens/home.dart';
import '../screens/product_detals.dart';
import '../style/them.dart';


void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  ThemeData them = MyTheme.them;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Products>(
      create: (context) {
        return Products();
      },
      child: MaterialApp(
        theme: them,
        initialRoute: "/",
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          ProductDetals.routeName: (context) => const ProductDetals()
        },
      ),
    );
  }
}
