import 'package:flutter/material.dart';
import 'package:modul8_homework/screens/home.dart';
import 'package:modul8_homework/screens/manage_products.dart';
import 'package:modul8_homework/screens/order_screen.dart';

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
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              onTap: () =>
                  Navigator.of(context).pushReplacementNamed(Home.routeName),
              leading: const Icon(Icons.shop_rounded),
              title: const Text("Do'kon"),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              onTap: () => Navigator.of(context)
                  .pushReplacementNamed(OrderScreen.routeName),
              leading: const Icon(Icons.payment_rounded),
              title: const Text("Buyurtmalar"),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              onTap: () => Navigator.of(context)
                  .pushReplacementNamed(ManageProducts.routeName),
              leading: const Icon(Icons.settings_rounded),
              title: const Text("Maxsulotlanri boshqarish"),
            ),
          ),
        ],
      ),
    );
  }
}
