// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:modul8_1/screens/cart_screen.dart';
import 'package:modul8_1/widgets/app_drawer.dart';
import 'package:provider/provider.dart';

import '../providers/card_provider.dart';
import '../widgets/custom_cart.dart';
import '../widgets/grid_view_item.dart';

enum SelectedScreenIndex {
  // ignore: constant_identifier_names
  All,
  // ignore: constant_identifier_names
  Favorite,
}

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  static const routeName = "/";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ignore: unused_field
  var _showFavoriteItems = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Mening do'konim"),
        actions: [
          PopupMenuButton(onSelected: (SelectedScreenIndex value) {
            setState(() {
              if (value == SelectedScreenIndex.All) {
                // ... All
                _showFavoriteItems = false;
              } else {
                // ... Favorite
                _showFavoriteItems = true;
              }
            });
          }, itemBuilder: (ctx) {
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
          }),
          Consumer<CartProvider>(
            builder: (context, value, child) => CustomCart(
              child: child!,
              number: value.items.length.toString(),
            ),
            child: IconButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(CartScreen.routeName),
                icon: const Icon(Icons.shopping_cart_rounded)),
          )
        ],
      ),
      body: GridViewItem(showFavoriteItems: _showFavoriteItems),
      drawer: const AppDrawer(),
    );
  }
}
