import 'package:flutter/material.dart';
import 'package:modul8_1/providers/card_provider.dart';
import 'package:modul8_1/screens/cart_screen.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../screens/home.dart';
import '../screens/product_detals.dart';
import '../style/them.dart';

void main(List<String> args) {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

  ThemeData them = MyTheme.them;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Products>(create: (context) => Products()),
        ChangeNotifierProvider<CartProvider>(
            create: (context) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: them,
        initialRoute: "/",
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          ProductDetals.routeName: (context) => const ProductDetals(),
          CartScreen.routeName:(context) => const CartScreen(),
        },
      ),
    );
  }
}
