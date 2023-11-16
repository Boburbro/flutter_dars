import 'package:flutter/material.dart';
import 'package:modul7_2/screens/home/all_items.dart';
import 'package:modul7_2/widgets/buildScreensMenu.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        AppBar(
          automaticallyImplyLeading: false,
          title: const Text("MENU"),
          centerTitle: true,
        ),
        BuildScreensMenu(Icons.home_filled, "Home", () {
          Navigator.of(context).pushReplacementNamed("/");
        }),
        BuildScreensMenu(Icons.interests_rounded, "All Items", () {
          Navigator.of(context).pushReplacementNamed(AllItems.routeName);
        })
      ]),
    );
  }
}
