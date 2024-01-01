import 'package:flutter/material.dart';
import 'package:modul10/providers/auth.dart';
import 'package:modul10/screens/auth.dart';
import 'package:provider/provider.dart';

import './style/them.dart';

import './screens/manage_product.dart';
import './screens/order_screen.dart';
import './screens/home.dart';
import './screens/edit_product.dart';
import './screens/product_detals.dart';
import './screens/cart_screen.dart';

import './providers/products.dart';
import './providers/card_provider.dart';
import './providers/order_provider.dart';

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
        ChangeNotifierProvider<Auth>(create: (ctx) => Auth()),
        ChangeNotifierProvider<CartProvider>(create: (ctx) => CartProvider()),
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (ctx) => Products(),
          update: (ctx, auth, productPrevious) =>
              productPrevious!..setToken(auth.token, auth.userId),
        ),
        ChangeNotifierProxyProvider<Auth, OrderProvider>(
          create: (ctx) => OrderProvider(),
          update: (ctx, auth, previous) =>
              previous!..setToken(auth.token, auth.userId),
        ),
      ],
      child: Consumer<Auth>(
        builder: (context, authData, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: them,
          home: authData.isAuth ? const HomeScreen() : const AuthScreen(),
          // initialRoute: authData.isAuth ? "/home" : "/auth",
          routes: {
            HomeScreen.routeName: (context) => const HomeScreen(),
            ProductDetals.routeName: (context) => const ProductDetals(),
            CartScreen.routeName: (context) => const CartScreen(),
            OrderScreen.routeName: (context) => const OrderScreen(),
            ManageProduct.routeName: (context) => const ManageProduct(),
            EditProduct.routeName: (context) => const EditProduct(),
            AuthScreen.routeName: (context) => const AuthScreen(),
          },
        ),
      ),
    );
  }
}
