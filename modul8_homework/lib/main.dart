import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import './screens/home.dart';
import './screens/cart_screen.dart';
import './screens/edit_product_screen.dart';
import './screens/manage_products.dart';
import './screens/order_screen.dart';

import './providers/order_rovider.dart';
import './providers/cart_item_provider.dart';
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
            create: (cxt) => ProductProvider()),
        ChangeNotifierProvider(create: (ctx) => CartItemProvider()),
        ChangeNotifierProvider(create: (ctx) => OrderProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
          useMaterial3: false,
          fontFamily: GoogleFonts.lato().fontFamily,
        ),
        initialRoute: '/',
        routes: {
          Home.routeName: (context) => const Home(),
          CartScreen.routeName: (context) => const CartScreen(),
          OrderScreen.routeName: (context) => const OrderScreen(),
          ManageProducts.routeName: (context) => const ManageProducts(),
          EditProductScreen.routeName: (context) => const EditProductScreen(),
        },
      ),
    );
  }
}
