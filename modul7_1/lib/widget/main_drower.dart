import 'package:flutter/material.dart';
import 'package:modul7_1/screens/items.dart';

class MainDrower extends StatelessWidget {
  const MainDrower({super.key});

  Widget _buildMenuItem(IconData icon, String title, Function() onTap) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon),
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            title: const Text(
              "MENU",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          _buildMenuItem(Icons.home, "Bosh sahifa",
              () => Navigator.of(context).pushNamed("/")),
          const Divider(
            height: 1,
          ),
          _buildMenuItem(Icons.category, "Maxsulotlar",
              () => Navigator.of(context).pushNamed(Items.routeName)),
        ],
      ),
    );
  }
}
