import 'package:flutter/material.dart';
import 'package:modul8_1/screens/home.dart';
import 'package:modul8_1/screens/manage_product.dart';
import 'package:modul8_1/screens/order_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        AppBar(
          title: const Text("Salom do'stim"),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        ListTile(
          leading: const Icon(Icons.shop_rounded),
          title: const Text("Magazin"),
          onTap: () =>
              Navigator.of(context).pushReplacementNamed(HomeScreen.routeName),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.payment_rounded),
          title: const Text("Buyurtmalar"),
          onTap: () =>
              Navigator.of(context).pushReplacementNamed(OrderScreen.routeName),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.settings_rounded),
          title: const Text("Manage products"),
          onTap: () => Navigator.of(context)
              .pushReplacementNamed(ManageProduct.routeName),
        ),
      ]),
    );
  }
}
