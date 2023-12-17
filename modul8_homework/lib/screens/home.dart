import 'package:flutter/material.dart';
import 'package:modul8_homework/providers/cart_item_provider.dart';
import 'package:modul8_homework/screens/cart_screen.dart';
import 'package:modul8_homework/widgets/custom_cart.dart';
import 'package:modul8_homework/widgets/home_screen_body.dart';
import 'package:provider/provider.dart';

import '../widgets/app_drower.dart';

enum SelectedScreenIndex {
  // ignore: constant_identifier_names
  All,
  // ignore: constant_identifier_names
  Favorite,
}

class Home extends StatefulWidget {
  static const routeName = '/';

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _showFavoriteScreen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Mening do'konim"),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              setState(() {
                if (value == SelectedScreenIndex.All) {
                  _showFavoriteScreen = false;
                } else {
                  _showFavoriteScreen = true;
                }
              });
            },
            itemBuilder: (ctx) {
              return const [
                PopupMenuItem(
                  value: SelectedScreenIndex.All,
                  child: Text("Barchasi"),
                ),
                PopupMenuItem(
                  value: SelectedScreenIndex.Favorite,
                  child: Text("Sevimlilar"),
                ),
              ];
            },
          ),
          Consumer<CartItemProvider>(
            builder: (ctx, value, child) => CustomCart(
              number: value.items.length.toString(),
              child: child!,
            ),
            child: IconButton(
              mouseCursor: MaterialStateMouseCursor.clickable,
              tooltip: "Buyurtmalar",
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              icon: const Icon(Icons.shopping_cart),
            ),
          )
        ],
      ),
      drawer: const AppDrawer(),
      body: HomeScreenBody(_showFavoriteScreen),
    );
  }
}
