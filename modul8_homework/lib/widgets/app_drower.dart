import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text("Menu"),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          Card(
            margin: const EdgeInsets.all(15),
            child: ListTile(
              onTap: () {},
              leading: const Icon(Icons.home_rounded),
              title: const Text("Home"),
            ),
          )
        ],
      ),
    );
  }
}
