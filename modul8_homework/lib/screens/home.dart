import 'package:flutter/material.dart';
import 'package:modul8_homework/screens/cart_screen.dart';
import 'package:modul8_homework/widgets/home_screen_body.dart';

import '../widgets/app_drower.dart';

enum SelectedScreenIndex {
  // ignore: constant_identifier_names
  All,
  // ignore: constant_identifier_names
  Favorite,
}

class Home extends StatefulWidget {
  static const routeName = '/';

  Home({super.key});

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
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              IconButton(
                mouseCursor: MaterialStateMouseCursor.clickable,
                tooltip: "Buyurtmalar",
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
                icon: const Icon(Icons.shopping_cart),
              ),
              Positioned(
                top: 15,
                right: 10,
                child: Container(
                  alignment: Alignment.center,
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  child: const Text(
                    "0",
                    style: TextStyle(
                      fontSize: 8,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
      drawer: const AppDrawer(),
      body: HomeScreenBody(_showFavoriteScreen),
    );
  }
}
