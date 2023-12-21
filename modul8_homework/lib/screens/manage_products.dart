import 'package:flutter/material.dart';
import 'package:modul8_homework/providers/product_provider.dart';
import 'package:modul8_homework/screens/edit_product_screen.dart';
import 'package:modul8_homework/widgets/app_drower.dart';
import 'package:modul8_homework/widgets/user_product_built.dart';
import 'package:provider/provider.dart';

class ManageProducts extends StatelessWidget {
  const ManageProducts({super.key});

  static const routeName = "/manage-products";

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductProvider>(context).items;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Maxsulotlarni boshqarish"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(EditProductScreen.routeName),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
          padding: const EdgeInsets.all(15),
          itemCount: products.length,
          itemBuilder: (ctx, index) {
            return ChangeNotifierProvider.value(
              value: products[index],
              child: const UserProductBuild(),
            );
          }),
    );
  }
}
