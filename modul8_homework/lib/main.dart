import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modul8_homework/screens/cart_screen.dart';
import 'package:provider/provider.dart';

import './screens/home.dart';

import './providers/product_provider.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
          create: (context) => ProductProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
          useMaterial3: false,
          fontFamily: GoogleFonts.montserrat().fontFamily,
        ),
        initialRoute: '/',
        routes: {
          Home.routeName: (context) => Home(),
          CartScreen.routeName: (context) => const CartScreen(),
        },
      ),
    );
  }
}
